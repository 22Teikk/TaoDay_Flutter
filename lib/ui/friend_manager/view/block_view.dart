import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:taoday/core/utils/values.dart';
import 'package:taoday/core/widgets/empty_layout.dart';
import 'package:taoday/ui/friend_manager/friend_controller.dart';

class BlockView extends GetView<FriendController> {
  const BlockView({super.key});

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
                    img: "assets/images/img_block_empty.png",
                    title: emptyBlock),
              )
            : const Column(
                children: [],
              ),
      ),
    );
  }
}
