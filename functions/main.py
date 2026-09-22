"""Cloud Functions para jo-experience-app.

Contiene el trigger que se dispara cada vez que se crea un documento nuevo
en la colección "sales" (es decir, cada vez que se registra una venta) y
envía una notificación push (FCM) a todos los dispositivos registrados.
"""

from firebase_admin import initialize_app, firestore, messaging
from firebase_functions import firestore_fn, options

options.set_global_options(region="us-central1")

initialize_app()

SALES_COLLECTION = "sales"
FCM_TOKENS_COLLECTION = "fcm_tokens"

# Códigos de error de FCM que indican que el token ya no es válido y debe
# eliminarse para no reintentar el envío en el futuro.
_INVALID_TOKEN_ERRORS = {
    "UNREGISTERED",
    "INVALID_ARGUMENT",
}


@firestore_fn.on_document_created(document=f"{SALES_COLLECTION}/{{sale_id}}")
def on_sale_created(event: firestore_fn.Event[firestore_fn.DocumentSnapshot | None]) -> None:
    """Se ejecuta al crear una venta nueva y notifica a todos los dispositivos."""
    snapshot = event.data
    if snapshot is None:
        print("El documento de venta no tiene datos, se omite.")
        return

    sale = snapshot.to_dict() or {}

    db = firestore.client()
    tokens_ref = db.collection(FCM_TOKENS_COLLECTION).stream()
    tokens = [doc.id for doc in tokens_ref]

    if not tokens:
        print("No hay tokens FCM registrados; se omite el envío.")
        return

    total = sale.get("total", "")
    moneda = sale.get("moneda", "")
    body = f"Se registró una venta por {moneda} {total}".strip()

    message = messaging.MulticastMessage(
        notification=messaging.Notification(
            title="Nueva venta registrada",
            body=body,
        ),
        data={
            "saleId": event.params["sale_id"],
            "idClient": str(sale.get("idClient", "")),
        },
        tokens=tokens,
    )

    response = messaging.send_each_for_multicast(message)
    print(f"Notificaciones enviadas: {response.success_count}/{len(tokens)}")

    invalid_tokens = []
    for token, result in zip(tokens, response.responses):
        if not result.success:
            error_code = getattr(result.exception, "code", None)
            if error_code in _INVALID_TOKEN_ERRORS:
                invalid_tokens.append(token)
            else:
                print(f"Error enviando a token {token}: {result.exception}")

    if invalid_tokens:
        batch = db.batch()
        for token in invalid_tokens:
            batch.delete(db.collection(FCM_TOKENS_COLLECTION).document(token))
        batch.commit()
        print(f"Tokens inválidos eliminados: {len(invalid_tokens)}")
