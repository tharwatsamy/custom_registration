import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      required this.hint,
      required this.onSaved,
      required this.textInputType})
      : super(key: key);

  final String hint;
  final ValueSetter onSaved;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: ((value) {
        if (value!.isEmpty) {
          return 'Field is requierd ';
        }
      }),
      keyboardType: textInputType,
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

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.hint,
      required this.onChanged,
      required this.textInputType,
   })
      : super(key: key);

  final String hint;
  final ValueSetter onChanged;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: textInputType,
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
