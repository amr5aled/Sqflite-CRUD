import 'package:image_picker/image_picker.dart';

class ImagePick {
  static Future<XFile> uploadFile() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image;
    image = await _picker.pickImage(source: ImageSource.camera);
    return image!;
  }
}
