import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:customer_registration_screen/Features/custom%20regitration/models/user_model.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../db/users_db.dart';

part 'store_data_state.dart';

class StoreDataCubit extends Cubit<StoreDataState> {
  StoreDataCubit() : super(StoreDataInitial());

  void storeData(UserModel user) async {
    emit(StoreDataILoading());
    var status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      try {
        var deviceName = await getDeviceName();
        var result = await Geolocator.getCurrentPosition();
        user.lat = result.latitude.toString();
        user.long = result.longitude.toString();
        user.deviceName = deviceName;
        int id = await UsersDataBase.instance.create(user);

        print(id);
        emit(
          StoreDataSuccess(),
        );
      } catch (e) {
        emit(StoreDataFailure(errMessage: e.toString()));
      }
    } else {
      emit(StoreDataFailure(errMessage: 'Permission was denied '));
    }
  }

  Future<String> getDeviceName() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String deviceName;
    if (Platform.isAndroid) {
      deviceName = (await deviceInfo.androidInfo).model!;
    } else {
      deviceName = (await deviceInfo.iosInfo).model!;
    }
    return deviceName;
  }
}
