import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taoday/core/utils/constant.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkFirst();
  }

  Future<bool> checkFirst() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isFirst = prefs.getBool(IS_FIRST) ?? true;
    return isFirst;
  }

  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(UID) != null ? true : false;
  }

  Future<bool> checkFirstLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(FIRST_LOGIN) ?? true;
  }
}
