import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taoday/ui/login/login_view.dart';
import 'package:taoday/ui/permission/permission_binding.dart';
import 'package:taoday/ui/permission/permission_four_view.dart';
import 'package:taoday/ui/permission/permission_mixin.dart';
import 'package:taoday/ui/permission/permission_three_view.dart';
import 'package:taoday/ui/permission/permission_two_view.dart';

class PermissionController extends GetxController with PermissionMixin {
  void requireNotificationPermission() async {
    var result = await Permission.notification.request();
    if (result.isDenied) {
      return;
    } else {
      Get.off(() => const PermissionTwoPage(),
          transition: Transition.rightToLeft, binding: PermissionBinding());
    }
  }

  void requireLocationPermission() async {
    var result = await Permission.location.request();
    if (result.isDenied) {
      return;
    } else {
      Get.off(() => const PermissionThreePage(),
          transition: Transition.rightToLeft, binding: PermissionBinding());
    }
  }

  void requireBatteryPermission() async {
    var status = await Permission.ignoreBatteryOptimizations.request();
    if (status.isGranted) {
      Get.off(() => const PermissionFourPage(),
          transition: Transition.rightToLeft, binding: PermissionBinding());
    }
  }

  void requireBackgroundPermission() async {
    var status = await Permission.locationAlways.request();
    if (status.isGranted) {
      Get.off(() => const LoginPage(), transition: Transition.rightToLeft);
    }
    // Get.off(() => const LoginPage(), transition: Transition.rightToLeft);
  }
}
