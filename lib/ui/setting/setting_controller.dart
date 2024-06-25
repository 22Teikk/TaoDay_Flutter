import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taoday/core/utils/constant.dart';
import 'package:taoday/core/utils/routes.dart';
import 'package:taoday/data/model/user.dart';
import 'package:taoday/data/provider/sqlite_provider.dart';

class SettingController extends GetxController {
  final SqliteProvider db;
  var user = User().obs;
  late SharedPreferences pref;

  SettingController({required this.db});

  @override
  void onInit() {
    super.onInit();
    getUserFromLocal();
  }

  void getUserFromLocal() async {
    pref = await SharedPreferences.getInstance();
    String uid = pref.getString(UID).toString();
    user.value = (await (db.getUserbyID(uid)))!;
  }

  void logOut() {
    pref.remove(FIRST_LOGIN);
    String uid = pref.getString(UID).toString();
    db.deleteUser(uid);
    pref.remove(UID);
    Get.offAllNamed(loginPage);
  }
}
