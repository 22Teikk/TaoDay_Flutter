// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:taoday/core/utils/constant.dart';
import 'package:taoday/core/utils/routes.dart';
import 'package:taoday/data/model/user.dart';
import 'package:taoday/data/provider/sqlite_provider.dart';
import 'package:taoday/data/service/api_service.dart';

class LoginController extends GetxController {
  SqliteProvider sqliteProvider;
  var user = User().obs;
  LoginController({
    required this.sqliteProvider,
  });
  final edtController = TextEditingController();
  final ApiService apiService = ApiService();

  Future<bool> postUser() async {
    try {
      var userTemp = User(
          name: edtController.text,
          uniqueID: "12",
          latitude: 12,
          longitude: 34);
      var result = await apiService.postUser(userTemp);
      if (result == null) {
        return false;
      } else {
        user.value = result;
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  Future saveState() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(UID, user.value.idUser);
    sqliteProvider.insertUser(user.value);
    Get.offNamed(addFriendPage);
  }
}
