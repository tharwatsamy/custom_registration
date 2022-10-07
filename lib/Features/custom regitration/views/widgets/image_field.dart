import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImageField extends StatelessWidget {
  const ImageField({Key? key, required this.onTap, required this.isImagePicked})
      : super(key: key);

  final VoidCallback onTap;
  final bool isImagePicked;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              isImagePicked ? 'Image Picked  successfully' : 'Pick Image',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
