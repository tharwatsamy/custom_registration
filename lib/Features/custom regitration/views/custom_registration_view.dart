import 'package:customer_registration_screen/Features/custom%20regitration/db/users_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'widgets/custom_registration_form.dart';

class CustomRegistrationView extends StatelessWidget {
  const CustomRegistrationView({Key? key}) : super(key: key);

  static const String id = 'custom_registration_view';
  @override
  Widget build(BuildContext context) {
   
    return const Scaffold(
      body: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: CustomRegistrationForm(),
        ),
      ]),
    );
  }
}
