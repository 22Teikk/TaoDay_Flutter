import 'package:get/get.dart';
import 'package:taoday/data/provider/sqlite_provider.dart';
import 'package:taoday/ui/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(db: SqliteProvider()));
  }
}
