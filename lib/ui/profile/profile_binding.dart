import 'package:get/get.dart';
import 'package:taoday/data/provider/sqlite_provider.dart';
import 'package:taoday/ui/profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(db: SqliteProvider()));
  }
}
