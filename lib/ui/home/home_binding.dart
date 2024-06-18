import 'package:get/get.dart';
import 'package:taoday/ui/home/bottom_sheet_controller.dart';
import 'package:taoday/ui/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => BottomSheetController());
  }
}
