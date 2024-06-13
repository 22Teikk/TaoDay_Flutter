import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taoday/core/utils/routes.dart';
import 'package:taoday/core/utils/values.dart';
import 'package:taoday/ui/permission/permission_controller.dart';

class PermissionTwoPage extends GetView<PermissionController> {
  const PermissionTwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    Permission.location.isGranted
        .then((value) {
      if (value == true) {
        Get.offNamed(permissionThreePage);
      }
    });
    return controller.buildUI(
        press: () {
          controller.requireLocationPermission();
        },
        title: "Access Your Location",
        content: contentPermissionTwo,
        image: 'assets/images/permission_two.png');
  }
}
