import 'package:image_picker/image_picker.dart';

abstract class ImageProductRepository {
  Future<void> updateImageProduct(String imageUrl);
  Future<String> uploadImageProduct(XFile image);
  Future<XFile?> pickImageFromGallery();
  Future<String?> getImageProduct();
}
