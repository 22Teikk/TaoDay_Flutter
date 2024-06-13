import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taoday/core/utils/routes.dart';
import 'package:taoday/core/utils/values.dart';
import 'package:taoday/ui/permission/permission_controller.dart';

class PermissionThreePage extends GetView<PermissionController> {
  const PermissionThreePage({super.key});

  @override
  Widget build(BuildContext context) {
        Permission.ignoreBatteryOptimizations.isGranted
        .then((value) {
      if (value == true) {
        Get.offNamed(permissionFourPage);
      }
    });
    return controller.buildUI(
        press: () {
          controller.requireBatteryPermission();
        },
        title: "Enable Stop Battery Optimzation",
        content: contentPermissionThree,
        image: 'assets/images/permission_three.png');
  }
}
