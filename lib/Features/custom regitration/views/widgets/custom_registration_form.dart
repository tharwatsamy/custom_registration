import 'package:customer_registration_screen/Features/custom%20regitration/views/widgets/custom_button.dart';
import 'package:customer_registration_screen/Features/custom%20regitration/views/widgets/custom_text_Form_field.dart';
import 'package:customer_registration_screen/Features/custom%20regitration/views/widgets/date_field.dart';
import 'package:customer_registration_screen/Features/custom%20regitration/views/widgets/image_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'custom_sized_box.dart';

class CustomRegistrationForm extends StatefulWidget {
  const CustomRegistrationForm({Key? key}) : super(key: key);

  @override
  State<CustomRegistrationForm> createState() => _CustomRegistrationFormState();
}

class _CustomRegistrationFormState extends State<CustomRegistrationForm> {
  DateTime? date;
  String? formattedDate;

  bool isPassportVisible = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 64,
            ),
            const CustomTextFormField(
              hint: 'first name',
            ),
            const CustomSizedBox(),
            const CustomTextFormField(
              hint: 'second name',
            ),
            const CustomSizedBox(),
            DateField(
              text: formattedDate,
              onTap: () async {
                date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1996),
                  lastDate: DateTime.now(),
                );

                formattedDate = DateFormat('dd-MM-yyyy').format(date!);
                print(formattedDate);
                checkChage(date);
              },
            ),
            Visibility(
              visible: isPassportVisible,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CustomSizedBox(),
                  CustomTextFormField(
                    hint: 'Passport',
                  ),
                ],
              ),
            ),
            const CustomSizedBox(),
            const CustomTextFormField(
              hint: 'Email',
            ),
            const CustomSizedBox(),
            ImageField(
              onTap: () {},
            ),
            const CustomSizedBox(),
            const Spacer(),
            const CustomButton(),
            const CustomSizedBox(),
          ],
        ),
      ),
    );
  }

  void checkChage(DateTime? date) {
    var age = DateTime.now().difference(date!).inDays / 365;
    if (age > 18) {
      isPassportVisible = true;
    } else {
      isPassportVisible = false;
    }

    setState(() {});
  }
}
