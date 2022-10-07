import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key, required this.hint, required this.onSaved}) : super(key: key);

  final String hint;
  final ValueSetter onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      onSaved: onSaved  ,
      validator: ((value) {
        if (value!.isEmpty) {
          return 'Field is requierd ';
        }
      }),
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
