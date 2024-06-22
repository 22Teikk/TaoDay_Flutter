import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taoday/data/provider/sqlite_provider.dart';

import '../../core/utils/constant.dart';
import '../../data/model/user.dart';
import '../../data/service/location_service.dart';

class ProfileController extends GetxController {
  final SqliteProvider db;
  late SharedPreferences pref;
  var user = User().obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var imageProfile = "".obs;
  var isEnable = false.obs;
  FocusNode focusNode = FocusNode();

  ProfileController({required this.db});

  @override
  void onInit() {
    super.onInit();
    getUserFromLocal();
  }

  void getUserFromLocal() async {
    pref = await SharedPreferences.getInstance();
    String uid = pref.getString(UID).toString();
    user.value = (await db.getUserbyID(uid))!;
    nameController.text = user.value.name;
    locationController.text = await getAddressFromLocation(latitude: user.value.latitude,longitude: user.value.longitude);
    emailController.text = user.value.email;
  }

  void updateImageProfile(String image) {
    imageProfile.value = image;
  }

  void enableChangeName() {
    isEnable.value = true;
    focusNode.requestFocus();
  }
}
