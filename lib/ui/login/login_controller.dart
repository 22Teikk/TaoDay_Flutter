import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:taoday/core/utils/routes.dart';
import 'package:taoday/data/model/user.dart';
import 'package:taoday/data/service/api_service.dart';

class LoginController extends GetxController {
  final edtController = TextEditingController();
  final ApiService apiService = ApiService();

  Future postUser() async {
    try {
      var user = User(
          name: edtController.text,
          uniqueID: "12",
          latitude: 12,
          longitude: 34);
      User? newUser = await apiService.postUser(user);
      if (newUser == null) {
        Get.snackbar("Load failed", "Please login again!");
      } else {
        Get.offNamed(homePage);
      }
    } catch (e) {
      Get.snackbar(e.toString(), "");
    }
  }
}
