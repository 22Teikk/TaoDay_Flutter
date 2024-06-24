import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taoday/core/utils/extensions.dart';
import 'package:taoday/core/utils/routes.dart';
import 'package:taoday/core/widgets/search_item.dart';
import 'package:taoday/ui/home/home_controller.dart';

import '../../core/widgets/empty_dialog.dart';
import '../../core/widgets/user_item.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              GoogleMap(
                  onMapCreated: (controllerMap) {
                    controller.onMapCreated(controllerMap);
                  },
                  mapToolbarEnabled: false,
                  zoomControlsEnabled: false,
                  initialCameraPosition: controller.currentPosition.value,
                  mapType: controller.type.value,
                  compassEnabled: true,
                  trafficEnabled: true,
                  myLocationEnabled: true,
                  indoorViewEnabled: true,
                  markers: Set<Marker>.of(controller.markers)),
              InkWell(
                onTap: () {
                  if (controller.listUser.isNotEmpty) {
                    Get.toNamed(sosPage);
                  } else {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return const EmptyDialog();
                      },
                    );
                  }
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  margin: EdgeInsets.only(top: 2.0.hp, left: 5.0.wp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Center(
                    child: Text(
                      "SOS",
                      style: TextStyle(
                        fontSize: 14.0.sp,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 2.0.hp,
                right: 5.0.wp,
                child: Column(
                  children: [
                    Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: IconButton(
                            onPressed: () {
                              Get.toNamed(settingPage);
                            },
                            icon: const Icon(
                              Icons.person_pin_sharp,
                              color: Colors.blue,
                            )),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2.0.hp),
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: IconButton(
                            onPressed: () {
                              Get.toNamed(sharePage);
                            },
                            icon: const Icon(
                              Icons.share,
                              color: Colors.blue,
                            )),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2.0.hp),
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: IconButton(
                            onPressed: () {
                              controller.changeMapType();
                            },
                            icon: const Icon(
                              Icons.map_outlined,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20.0.hp,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.toNamed(friendPage);
                    },
                    icon: const Icon(
                      Icons.people_outline_outlined,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.15,
                minChildSize: 0.15,
                maxChildSize: 0.5,
                snapSizes: const [0.15, 0.5],
                snap: true,
                controller: controller.draggableController,
                builder: (BuildContext context, scrollSheetController) {
                  return Obx(
                    () => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.0.wp),
                              topLeft: Radius.circular(8.0.wp)),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Divider(
                            indent: 40.0.wp,
                            endIndent: 40.0.wp,
                            thickness: 4,
                          ),
                          if (controller.isMaxSize.value == true)
                            const SizedBox(
                              height: 15,
                            ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0.wp),
                            child: controller.isMaxSize.value
                                ? SearchWidget(
                                    title: "Search by Name",
                                    controller: controller.searchController,
                                  )
                                : const SizedBox(
                                    height: 10,
                                  ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: const ClampingScrollPhysics(),
                              controller: scrollSheetController,
                              itemCount: controller.listUser.length + 1,
                              itemBuilder: (BuildContext context, int index) {
                                if (index == 0) {
                                  return UserItem(
                                    user: controller.user.value,
                                    controller: controller,
                                    isMe: true,
                                  );
                                } else {
                                  return UserItem(
                                    user: controller.listUser[index - 1],
                                    controller: controller,
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
