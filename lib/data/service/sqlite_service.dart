import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:taoday/core/utils/constant.dart';
import 'package:taoday/data/model/user.dart';

class SqliteService extends GetxService {
  late Database _db;
  Future<SqliteService> init() async {
    _db = await _initDatabase();
    return this;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "taoday.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) => db.execute(
        '''
        CREATE TABLE IF NOT EXISTS $USER_TABLE (
          idUser TEXT PRIMARY KEY,
          idGoogle TEXT,
          name TEXT,
          email TEXT,
          avatar TEXT,
          status TEXT,
          qrCode TEXT,
          uniqueID TEXT,
          session TEXT,
          latitude REAL,
          longitude REAL,
          rotation REAL,
          friendshipStatus TEXT,
          idFriendship TEXT,
          idAvatar TEXT
        )
        ''',
      ),
    );
  }

  Future<int> insertUser(User user) async {
    return await _db.insert(
      USER_TABLE,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<User?> getUserByID(String id) async {
    final List<Map<String, dynamic>> maps = await _db.query(
      USER_TABLE,
      where: "idUser =?",
      whereArgs: [id],
    );
    return maps.isNotEmpty ? User.fromMap(maps.first) : null;
  }

  Future<int> updateUser(User user) async {
    return await _db.update(
      USER_TABLE,
      user.toMap(),
      where: "idUser=?",
      whereArgs: [user.idUser],
    );
  }

  Future<int> deleteUser(String uid) async {
    return await _db.delete(
      USER_TABLE,
      where: "idUser=?",
      whereArgs: [uid],
    );
  }
}
