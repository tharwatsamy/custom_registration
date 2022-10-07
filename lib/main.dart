import 'package:flutter/material.dart';

import 'Features/custom regitration/views/custom_registration_view.dart';

void main() {
  runApp(const FlutterTestApp());
}

class FlutterTestApp extends StatelessWidget {
  const FlutterTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        CustomRegistrationView.id: (constext) => const CustomRegistrationView()
      },
      initialRoute: CustomRegistrationView.id,
    );
  }
}
