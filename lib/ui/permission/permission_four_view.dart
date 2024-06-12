import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taoday/core/utils/values.dart';
import 'package:taoday/ui/permission/permission_controller.dart';

class PermissionFourPage extends GetView<PermissionController> {
  const PermissionFourPage({super.key});

  @override
  Widget build(BuildContext context) {
        Permission.locationAlways.isGranted
        .then((value) => controller.requireBackgroundPermission());
    return controller.buildUI(
        press: () {
          controller.requireBackgroundPermission();
        },
        title: "Allow Background Activity",
        content: contentPermissionFour,
        image: 'assets/images/permission_four.png');
  }
}
