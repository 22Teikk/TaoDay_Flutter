import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:taoday/core/utils/values.dart';
import 'package:taoday/core/widgets/empty_layout.dart';
import 'package:taoday/ui/friend_manager/friend_controller.dart';

class FriendView extends GetView<FriendController> {
  const FriendView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEmpty = true;
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: isEmpty == true
            ? const Center(
                child: EmptyLayout(
                    img: "assets/images/img_friend_empty.png",
                    title: emptyFriend),
              )
            : const Column(
                children: [],
              ),
      ),
    );
  }
}
