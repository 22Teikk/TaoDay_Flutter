import 'package:get/instance_manager.dart';
import 'package:taoday/ui/setting/setting_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}
