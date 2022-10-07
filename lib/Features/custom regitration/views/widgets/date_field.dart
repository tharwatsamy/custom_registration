import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DateField extends StatelessWidget {
  const DateField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text(
            'Date',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}