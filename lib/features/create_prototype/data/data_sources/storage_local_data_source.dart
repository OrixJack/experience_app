import 'package:flutter/foundation.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:image_picker/image_picker.dart';

class StorageLocalDataSource {
  StorageLocalDataSource();

  /// Selecciona una imagen de la galería.
  /// Para web, devuelve XFile con bytes disponibles.
  /// Para mobile/desktop, devuelve XFile con path al archivo.
  Future<XFile?> pickImageFromGallery({ImagePicker? imagePicker}) async {
    try {
      if (kIsWeb) {
        // Para web, usar image_picker_web
        final imageBytes = await ImagePickerWeb.getImageAsBytes();
        if (imageBytes == null) return null;

        // Crear XFile con los bytes
        return XFile.fromData(imageBytes, name: 'image.jpg');
      } else {
        // Para mobile/desktop, usar image_picker
        final XFile? image = await (imagePicker ?? ImagePicker()).pickImage(
          source: ImageSource.gallery,
        );
        return image;
      }
    } catch (e) {
      return null;
    }
  }
}
