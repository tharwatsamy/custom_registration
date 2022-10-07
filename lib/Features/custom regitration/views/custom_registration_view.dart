import 'package:customer_registration_screen/Features/custom%20regitration/db/users_db.dart';
import 'package:customer_registration_screen/Features/custom%20regitration/view_models/cubit/store_data_cubit.dart';
import 'package:customer_registration_screen/core/utils/fucntions/build_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'widgets/custom_registration_form.dart';

class CustomRegistrationView extends StatelessWidget {
  const CustomRegistrationView({Key? key}) : super(key: key);

  static const String id = 'custom_registration_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<StoreDataCubit, StoreDataState>(
        listener: (context, state) {
          if (state is StoreDataSuccess) {
            buildSnackBar('Data stored successfully', context);
          }
          if (state is StoreDataFailure) {
            buildSnackBar(state.errMessage, context);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is StoreDataILoading ? true : false,
            child: const CustomScrollView(slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: CustomRegistrationForm(),
              ),
            ]),
          );
        },
      ),
    );
  }
}
