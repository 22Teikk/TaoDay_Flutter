import 'package:get/get.dart';
import 'package:taoday/data/provider/sqlite_provider.dart';
import 'package:taoday/ui/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(sqliteProvider: SqliteProvider()),
    );
  }
}
