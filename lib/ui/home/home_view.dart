import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taoday/core/utils/extensions.dart';
import 'package:taoday/core/utils/routes.dart';
import 'package:taoday/core/widgets/line_bottom_sheet.dart';
import 'package:taoday/ui/home/bottom_sheet_controller.dart';
import 'package:taoday/ui/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  static const CameraPosition _kLake = CameraPosition(
    target: LatLng(37.43296265331129, -122.08832357078792),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              GoogleMap(
                zoomControlsEnabled: false,
                initialCameraPosition: _kLake,
                mapType: controller.type.value,
              ),
              Container(
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
                            onPressed: () {},
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
                height: 30.0.hp,
                bottom: 0,
                right: 0,
                left: 0,
                child: const MyDraggableSheet(
                  child: Column(
                    children: [],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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

                    // SliverToBoxAdapter(
                    //   child: ,
                    // ),
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
              onPressed: () {},
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
