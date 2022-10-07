import 'package:customer_registration_screen/Features/custom%20regitration/views/widgets/custom_button.dart';
import 'package:customer_registration_screen/Features/custom%20regitration/views/widgets/custom_text_Form_field.dart';
import 'package:customer_registration_screen/Features/custom%20regitration/views/widgets/date_field.dart';
import 'package:customer_registration_screen/Features/custom%20regitration/views/widgets/image_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'custom_sized_box.dart';

class CustomRegistrationForm extends StatelessWidget {
  const CustomRegistrationForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: const [
            SizedBox(
              height: 64,
            ),
            CustomTextFormField(
              hint: 'first name',
            ),
            CustomSizedBox(),
            CustomTextFormField(
              hint: 'second name',
            ),
            CustomSizedBox(),
            DateField(),
            CustomSizedBox(),
            CustomTextFormField(
              hint: 'Passport',
            ),
            CustomSizedBox(),
            CustomTextFormField(
              hint: 'Email',
            ),
            CustomSizedBox(),
            ImageField(),
            CustomSizedBox(),
            Spacer(),
            CustomButton(),
            CustomSizedBox(),
          ],
        ),
      ),
    );
  }
}
