import 'package:customer_registration_screen/Features/custom%20regitration/db/users_db.dart';
import 'package:customer_registration_screen/Features/custom%20regitration/view_models/cubit/store_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Features/custom regitration/views/custom_registration_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UsersDataBase.instance.database;
  runApp(const FlutterTestApp());
}

class FlutterTestApp extends StatelessWidget {
  const FlutterTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StoreDataCubit(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        routes: {
          CustomRegistrationView.id: (constext) =>
              const CustomRegistrationView()
        },
        initialRoute: CustomRegistrationView.id,
      ),
    );
  }
}
