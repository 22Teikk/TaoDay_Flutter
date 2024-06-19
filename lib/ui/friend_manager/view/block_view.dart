import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:taoday/ui/friend_manager/friend_controller.dart';

class BlockView extends GetView<FriendController> {
  const BlockView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container());
  }
}
