import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

Future<String?> pickImage() async {
  ImagePicker picker = ImagePicker();

  XFile? image = await picker.pickImage(source: ImageSource.camera);

  if (image != null) {
    await GallerySaver.saveImage(image.path);

    return image.path;
  } else {
    return null;
  }
}
