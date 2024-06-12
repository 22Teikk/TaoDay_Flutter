import 'package:get/get.dart';
import 'package:taoday/ui/permission/permission_controller.dart';

class PermissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PermissionController());
  }
}
