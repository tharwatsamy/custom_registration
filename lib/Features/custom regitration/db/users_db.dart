import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user_model.dart';

class UsersDataBase {
  static final UsersDataBase instance = UsersDataBase._init();

  static Database? _database;
  UsersDataBase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDataBase('users');
    return _database!;
  }

  Future<Database> _initDataBase(String s) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, s);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  FutureOr<void> _onCreate(Database db, int version) {
    // const idType = 'INTEGER PRIMARY KEY AutoIncrement';

    const textType = 'TEXT NOT NULL';

    db.execute('''
CREATE TABLE $usersTable (
  id INTEGER PRIMARY KEY,
  ${UserFields.dateTime} $textType,
  ${UserFields.email} $textType,
  ${UserFields.firstName} $textType,
  ${UserFields.secondName} $textType,
  ${UserFields.imei} $textType,
  ${UserFields.image} $textType,
  ${UserFields.passport} $textType)
''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<int> create(UserModel user) async {
    final db = await instance.database;
    int id = await db.insert(usersTable, user.toJson());
    return id;
  }

  Future<UserModel> read(int id) async {
    final db = await instance.database;
    final data = await db.query(
      usersTable,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );

    if (data.isNotEmpty) {
      return UserModel.fromJson(data.first);
    } else {
      return throw Exception('$id not found');
    }
  }
}
