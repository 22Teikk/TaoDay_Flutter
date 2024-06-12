import 'package:get/get.dart';
import 'package:taoday/ui/policy/policy_controller.dart';

class PolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PolicyController());
  }

}