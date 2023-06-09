import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
  pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();

    XFile? _file = await imagePicker.pickImage(source: source);

    if (_file != null) {
      return await _file.readAsBytes();
    }
    print('No image selected');
  }

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}
