import 'package:get/get.dart';
import 'package:taoday/ui/friend_manager/friend_controller.dart';

class FriendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FriendController());
  }
}
