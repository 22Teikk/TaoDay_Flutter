import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taoday/core/utils/routes.dart';
import 'package:taoday/ui/permission/permission_mixin.dart';

class PermissionController extends GetxController with PermissionMixin {
  void requireNotificationPermission() async {
    var result = await Permission.notification.request();
    if (result.isDenied) {
      return;
    } else {
      Get.offNamed(permissionTwoPage);
    }
  }

  void requireLocationPermission() async {
    var result = await Permission.location.request();
    if (result.isDenied) {
      return;
    } else {
      Get.offNamed(permissionThreePage);
    }
  }

  void requireBatteryPermission() async {
    var status = await Permission.ignoreBatteryOptimizations.request();
    if (status.isGranted) {
      Get.offNamed(permissionFourPage);
    }
  }

  void requireBackgroundPermission() async {
    var status = await Permission.locationAlways.request();
    if (status.isGranted) {
      Get.offNamed(loginPage);
    }
  }
}
