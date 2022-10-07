import 'package:customer_registration_screen/Features/custom%20regitration/db/users_db.dart';
import 'package:customer_registration_screen/Features/custom%20regitration/models/user_model.dart';
import 'package:customer_registration_screen/Features/custom%20regitration/views/widgets/custom_button.dart';
import 'package:customer_registration_screen/Features/custom%20regitration/views/widgets/custom_text_Form_field.dart';
import 'package:customer_registration_screen/Features/custom%20regitration/views/widgets/date_field.dart';
import 'package:customer_registration_screen/Features/custom%20regitration/views/widgets/image_field.dart';
import 'package:customer_registration_screen/core/utils/fucntions/pick_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unique_identifier/unique_identifier.dart';

import '../../../../core/utils/fucntions/check_age.dart';
import 'custom_sized_box.dart';

class CustomRegistrationForm extends StatefulWidget {
  const CustomRegistrationForm({Key? key}) : super(key: key);

  @override
  State<CustomRegistrationForm> createState() => _CustomRegistrationFormState();
}

class _CustomRegistrationFormState extends State<CustomRegistrationForm> {
  DateTime? date;
  String? formattedDate,
      firstName,
      secondName,
      email,
      imagePath,
      passport,
      imei;
  bool isPassportVisible = true;

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    initUniqueIdentifierState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: key,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 64,
            ),
            CustomTextField(
              textInputType: TextInputType.name,
              onChanged: (value) {},
              hint: imei ?? 'imei',
            ),
            const CustomSizedBox(),
            CustomTextFormField(
              textInputType: TextInputType.name,
              onSaved: (value) {
                firstName = value;
              },
              hint: 'first name',
            ),
            const CustomSizedBox(),
            CustomTextFormField(
              textInputType: TextInputType.name,
              onSaved: (value) {
                secondName = value;
              },
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

                isPassportVisible = checkChage(date);
                setState(() {});
              },
            ),
            isPassportVisible
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CustomSizedBox(),
                      CustomTextFormField(
                        textInputType: TextInputType.number,
                        onSaved: (value) {
                          passport = value;
                        },
                        hint: 'Passport',
                      ),
                    ],
                  )
                : const SizedBox(),
            const CustomSizedBox(),
            CustomTextFormField(
              textInputType: TextInputType.emailAddress,
              onSaved: (value) {
                email = value;
              },
              hint: 'Email',
            ),
            const CustomSizedBox(),
            ImageField(
              isImagePicked: imagePath == null ? false : true,
              onTap: () async {
                imagePath = await pickImage();
                setState(() {});
              },
            ),
            const CustomSizedBox(),
            const Spacer(),
            CustomButton(
              onTap: () async {
                if (key.currentState!.validate()) {
                  key.currentState!.save();

                  if (imagePath != null || imei == null) {
                    saveData();
                  } else {
                    buildSnackBar('Image and IMEI  are required');
                  }
                } else {
                  autovalidateMode = AutovalidateMode.onUserInteraction;

                  setState(() {});
                }
              },
            ),
            const CustomSizedBox(),
          ],
        ),
      ),
    );
  }

  void saveData() async {
    int id = await UsersDataBase.instance.create(
      UserModel(
          firstName: firstName!,
          secondName: secondName!,
          dateTime: formattedDate!,
          email: email!,
          imei: imei!,
          passport: passport ?? '',
          image: imagePath!),
    );
    if (mounted) {
      buildSnackBar('data saved successfully');
    }
  }

  void buildSnackBar(text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  void initUniqueIdentifierState() async {
    try {
      imei = await UniqueIdentifier.serial;
    } catch (e) {
      imei = null ;
    }

    if (!mounted) return;

    setState(() {});
  }
}
