import 'package:get/get.dart';
import 'package:taoday/data/provider/sqlite_provider.dart';
import 'package:taoday/ui/share/share_controller.dart';

class ShareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShareController(db: SqliteProvider()));
  }
}
