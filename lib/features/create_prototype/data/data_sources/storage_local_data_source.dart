import 'package:image_picker/image_picker.dart';

class StorageLocalDataSource {
  StorageLocalDataSource();

  /// Selecciona una imagen de la galería.
  /// image_picker soporta Web, mobile y desktop de forma nativa.
  Future<XFile?> pickImageFromGallery({ImagePicker? imagePicker}) async {
    try {
      final XFile? image = await (imagePicker ?? ImagePicker()).pickImage(
        source: ImageSource.gallery,
      );
      return image;
    } catch (e) {
      return null;
    }
  }
}

