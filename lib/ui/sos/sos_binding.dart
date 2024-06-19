import 'package:get/get.dart';
import 'package:taoday/ui/sos/sos_controller.dart';

class SosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SosController());
  }
}
