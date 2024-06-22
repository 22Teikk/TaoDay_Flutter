import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taoday/core/utils/extensions.dart';
import 'package:taoday/core/utils/routes.dart';
import 'package:taoday/core/widgets/search_item.dart';
import 'package:taoday/core/widgets/user_item.dart';
import 'package:taoday/ui/home/bottom_sheet_view.dart';
import 'package:taoday/ui/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  static const CameraPosition kLake =
      CameraPosition(target: LatLng(-33.86, 151.20), zoom: 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              GoogleMap(
                onMapCreated: (controllerMap) {
                  controller.mapController = controllerMap;
                },
                mapToolbarEnabled: false,
                zoomControlsEnabled: false,
                initialCameraPosition: kLake,
                mapType: controller.type.value,
                compassEnabled: true,
                trafficEnabled: true,
                myLocationEnabled: true,
                indoorViewEnabled: true,
                // polygons: {const Polygon(polygonId: PolygonId("Hehe"))},
                markers: {
                  Marker(
                    markerId: const MarkerId('Sydney'),
                    anchor: const Offset(0.5, 1),
                    position: const LatLng(-33.86, 151.20),
                    icon: controller.markerIcon.value,
                    infoWindow: const InfoWindow(
                      title: "Kiet nt",
                    ),
                  )
                },
              ),
              InkWell(
                onTap: () => Get.toNamed(sosPage),
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
                height: 30.0.hp,
                bottom: 0,
                right: 0,
                left: 0,
                child: MyDraggableSheet(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: const Column(
                      children: [
                        UserItem(
                          image: "assets/images/app_name.png",
                          name: "Kiet NT (me)",
                          location: "112 Tran Phu, Ha Dong",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SearchWidget(title: "Search"),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
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
