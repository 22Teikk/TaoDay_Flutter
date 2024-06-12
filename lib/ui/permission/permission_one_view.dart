import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taoday/core/utils/values.dart';
import 'package:taoday/ui/permission/permission_controller.dart';

class PermissionOnePage extends GetView<PermissionController> {
  const PermissionOnePage({super.key});

  @override
  Widget build(BuildContext context) {
    Permission.notification.isGranted
        .then((value) => controller.requireNotificationPermission());
    return controller.buildUI(
        press: () {
          controller.requireNotificationPermission();
        },
        title: "Enable Notification",
        content: contentPermissionOne,
        image: 'assets/images/permission_one.png');
  }
}
