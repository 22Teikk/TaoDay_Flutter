import 'package:get/get.dart';
import 'package:taoday/data/provider/sqlite_provider.dart';
import 'package:taoday/data/service/api_service.dart';
import 'package:taoday/ui/add_friend/add_friend_controller.dart';

class AddFriendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        AddFriendController(db: SqliteProvider(), apiService: ApiService()));
  }
}
