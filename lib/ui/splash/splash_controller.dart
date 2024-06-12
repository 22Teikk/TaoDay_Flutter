import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taoday/core/utils/constant.dart';

class SplashController extends GetxController {
  var isFirst = true.obs;
  @override
  void onInit() {
    super.onInit();
    checkFirst();
  }

  void checkFirst() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirst.value = prefs.getBool(IS_FIRST) ?? true;
  }
}