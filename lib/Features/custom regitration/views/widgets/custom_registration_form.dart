import 'dart:io' show Platform;

import 'package:customer_registration_screen/Features/custom%20regitration/db/users_db.dart';
import 'package:customer_registration_screen/Features/custom%20regitration/models/user_model.dart';
import 'package:customer_registration_screen/Features/custom%20regitration/view_models/cubit/store_data_cubit.dart';
import 'package:customer_registration_screen/Features/custom%20regitration/views/widgets/custom_button.dart';
import 'package:customer_registration_screen/Features/custom%20regitration/views/widgets/custom_text_Form_field.dart';
import 'package:customer_registration_screen/Features/custom%20regitration/views/widgets/date_field.dart';
import 'package:customer_registration_screen/Features/custom%20regitration/views/widgets/image_field.dart';
import 'package:customer_registration_screen/core/utils/fucntions/pick_image.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:unique_identifier/unique_identifier.dart';

import '../../../../core/utils/fucntions/build_snackbar.dart';
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

  bool isLoading = false;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 64,
            ),
            const Text(
              'IMEI',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 8,
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
            CustomTextField(
              textInputType: TextInputType.emailAddress,
              onChanged: (value) {
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
              isLoading: isLoading,
              onTap: () async {
                validateData();
              },
            ),
            const CustomSizedBox(),
          ],
        ),
      ),
    );
  }

  void validateData() async {
    if (key.currentState!.validate()) {
      key.currentState!.save();

      if (imagePath != null || imei == null) {
        BlocProvider.of<StoreDataCubit>(context).storeData(UserModel(
            firstName: firstName!,
            secondName: secondName!,
            dateTime: formattedDate!,
            email: email,
            imei: imei!,
            passport: passport ?? '',
            image: imagePath!));
      } else {
        buildSnackBar('Image and IMEI  are required' , context );
      }
    } else {
      autovalidateMode = AutovalidateMode.onUserInteraction;

      setState(() {});
    }
  }

  

  void initUniqueIdentifierState() async {
    try {
      imei = await UniqueIdentifier.serial;
    } catch (e) {
      imei = null;
    }
    setState(() {});
  }
}
