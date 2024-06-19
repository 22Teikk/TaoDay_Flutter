import 'package:get/get.dart';
import 'package:taoday/ui/emergency/emergency_controller.dart';

class EmergencyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmergencyController());
  }
}
