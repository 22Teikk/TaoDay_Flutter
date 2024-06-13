import 'package:get/get.dart';
import 'package:taoday/data/model/user.dart';
import 'package:taoday/data/service/sqlite_service.dart';

class SqliteProvider {
  SqliteService db = Get.find<SqliteService>();
  Future<User?> getUserbyID(String id) async {
    return await db.getUserByID(id);
  }

  void insertUser(User user) async {
    db.insertUser(user);
  }

  void updateUser(User user) async {
    db.updateUser(user);
  }

  void deleteUser(String uid) async {
    db.deleteUser(uid);
  }
}
