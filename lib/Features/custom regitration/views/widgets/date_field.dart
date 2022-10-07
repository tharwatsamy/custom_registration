import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DateField extends StatelessWidget {
  const DateField({Key? key, required this.onTap, this.text}) : super(key: key);

  final VoidCallback onTap;
  final String? text;
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
              text ?? 'Date',
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
