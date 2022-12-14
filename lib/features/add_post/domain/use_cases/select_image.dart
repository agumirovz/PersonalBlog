import 'package:image_picker/image_picker.dart';

class SelectImage {
  late bool imagePicked;

  pickImageFromGallery() async {
    final ImagePicker imagePicker = ImagePicker();

    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    if (file != null) {
      return await file.readAsBytes();
    } else {}
  }
}
