
import 'package:flutter/material.dart';

void buildSnackBar(text , context ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }