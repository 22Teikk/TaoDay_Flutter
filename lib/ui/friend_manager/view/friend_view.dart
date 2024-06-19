import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoday/ui/friend_manager/friend_controller.dart';

class FriendView extends GetView<FriendController> {
  const FriendView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.black,
      ),
    );
  }
}
