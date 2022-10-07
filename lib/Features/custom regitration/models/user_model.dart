import 'package:flutter/foundation.dart';

const String usersTable = 'users';

class UserFields {
  static const String id = '_id';
  static const String imei = 'imei';
  static const String firstName = 'firstName';
  static const String secondName = 'secondName';
  static const String dateTime = 'dateTime';
  static const String email = 'email';
  static const String passport = 'passport';
  static const String image = 'image';
  static const String lat = 'lat';
  static const String long = 'long';
  static const String deviceName = 'deviceName';
}

class UserModel {
  int? id;
  final String imei;
  final String firstName;
  final String secondName;
  final String dateTime;
  final String? email;
  final String? passport;
  final String image;
  final String? lat;
  final String? long;
  final String deviceName;

  UserModel(
      {required this.firstName,
      required this.secondName,
      required this.dateTime,
      this.id,
      this.lat,
      this.long,
      required this.deviceName,
      required this.email,
      required this.imei,
      required this.passport,
      required this.image});

  Map<String, dynamic> toJson() {
    return {
      UserFields.dateTime: dateTime.toString(),
      UserFields.firstName: firstName,
      UserFields.secondName: secondName,
      UserFields.image: image,
      UserFields.deviceName: deviceName,
      UserFields.passport: passport,
      UserFields.email: imei.toString(),
      UserFields.imei: imei,
      UserFields.lat: lat,
      UserFields.long: long,
    };
  }

  static fromJson(json) {
    return UserModel(
      lat: json[UserFields.lat],
      long: json[UserFields.long],
      deviceName: json[UserFields.deviceName],
      firstName: json[UserFields.firstName],
      secondName: json[UserFields.secondName],
      dateTime: json[UserFields.dateTime],
      email: json[UserFields.email],
      imei: json[UserFields.imei],
      passport: json[UserFields.passport],
      image: json[UserFields.image],
    );
  }
}
