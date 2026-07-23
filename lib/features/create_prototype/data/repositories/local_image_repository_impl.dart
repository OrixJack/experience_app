import 'package:image_picker/image_picker.dart';
import '../../domain/repositories/local_image_repository.dart';
import '../data_sources/storage_local_data_source.dart';

class LocalImageRepositoryImpl extends LocalImageRepository {
  LocalImageRepositoryImpl();

  @override
  Future<XFile?> saveLocalImage() async {
    try {
      return await StorageLocalDataSource().pickImageFromGallery();
    } catch (e) {
      return null;
    }
  }
}
