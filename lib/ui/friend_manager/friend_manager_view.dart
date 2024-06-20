import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoday/core/utils/routes.dart';
import 'package:taoday/core/widgets/search_item.dart';
import 'package:taoday/ui/friend_manager/friend_controller.dart';
import 'package:taoday/ui/friend_manager/view/block_view.dart';
import 'package:taoday/ui/friend_manager/view/friend_view.dart';
import 'package:taoday/ui/friend_manager/view/history_view.dart';
import 'package:taoday/ui/friend_manager/view/request_view.dart';

class FriendManagerPage extends GetView<FriendController> {
  const FriendManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(
              text: "Friends",
            ),
            Tab(
              text: "Request",
            ),
            Tab(
              text: "History",
            ),
            Tab(
              text: "Block",
            ),
          ]),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_on_outlined,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                Get.toNamed(addFriendPage, arguments: false);
              },
              icon: const Icon(
                Icons.person_add_alt,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        body: const SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SearchWidget(
                  title: "Search",
                  isIcon: false,
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      FriendView(),
                      RequestView(),
                      HistoryView(),
                      BlockView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
