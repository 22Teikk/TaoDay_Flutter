import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoday/core/utils/routes.dart';
import 'package:taoday/core/widgets/line_bottom_sheet.dart';
import 'package:taoday/ui/home/bottom_sheet_controller.dart';

class MyDraggableSheet extends GetView<BottomSheetController> {
  final Widget child;
  const MyDraggableSheet({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          DraggableScrollableSheet(
            key: controller.sheet,
            initialChildSize: 0.5,
            maxChildSize: 0.95,
            minChildSize: 0.2,
            expand: true,
            snap: true,
            snapSizes: [
              60 / constraints.maxHeight,
              0.5,
            ],
            controller: controller.controllerScrollable,
            builder: (BuildContext context, ScrollController scrollController) {
              return DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                  ),
                ),
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    topButtonIndicator(),
                    SliverToBoxAdapter(
                      child: child,
                    ),
                  ],
                ),
              );
            },
          ),
          AnimatedPositioned(
            curve: Curves.linear,
            duration: const Duration(milliseconds: 300),
            bottom: constraints.maxHeight * 0.5 + 20,
            right: 20,
            child: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: Colors.white,
              onPressed: () {
                Get.toNamed(friendPage);
              },
              child: const Icon(
                Icons.people_outline_outlined,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      );
    });
  }
}
