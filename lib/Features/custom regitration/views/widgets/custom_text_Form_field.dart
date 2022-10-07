import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key, required this.hint}) : super(key: key);

  final String hint;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: hint,
          border: buildBorder(),
          focusedBorder: buildBorder(),
          disabledBorder: buildBorder(),
          enabledBorder: buildBorder()),
    );
  }

  OutlineInputBorder buildBorder() => const OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.white,
      ));
}
