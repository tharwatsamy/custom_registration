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
}

class UserModel {
  final int? id;
  final int imei;
  final String firstName;
  final String secondName;
  final String dateTime;
  final String email;
  final String passport;
  final String image;

  UserModel(
      {required this.firstName,
      required this.secondName,
      required this.dateTime,
      this.id,
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
      UserFields.passport: passport,
      UserFields.email: imei.toString(),
      UserFields.imei: imei,
    };
  }

  static fromJson(json) {
    return UserModel(
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
