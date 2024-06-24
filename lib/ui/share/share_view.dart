import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taoday/core/utils/extensions.dart';
import 'package:taoday/ui/share/share_controller.dart';

class SharePage extends GetView<ShareController> {
  const SharePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Share",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 14.0.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Container(
              color: Colors.black,
              height: 40.0.hp,
              child: Stack(
                children: [
                  GoogleMap(
                    onMapCreated: (controllerMap) {
                      controller.onMapCreated(controllerMap);
                    },
                    markers: Set<Marker>.of(controller.markers),
                    zoomControlsEnabled: false,
                    initialCameraPosition: controller.currentPosition.value,
                    onTap: (latLng) {
                      controller.findLocation(latLng);
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: SearchBar(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.white.withOpacity(.8)),
                      hintText: "Search...",
                      keyboardType: TextInputType.streetAddress,
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                      ),
                      controller: controller.searchController,
                      onSubmitted: (str) {
                        controller.findLocation(null);
                      },
                      leading: const Icon(Icons.search),
                      trailing: [
                        if (controller.isEmptySeach.value == false) IconButton(
                          onPressed: () {
                            controller.isEmptySeach.value = true;
                            controller.searchController.clear();
                          },
                          icon: const Icon(Icons.close_sharp),
                        ) else const Spacer(),
                      ],
                      onChanged: (str) {
                        if (str.isNotEmpty) {
                          controller.isEmptySeach.value = false;
                        } else {
                          controller.isEmptySeach.value = true;
                        }
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: IconButton(
                      onPressed: () {
                        controller.moveToCurrentLocation();
                      },
                      icon: Container(
                        width: 10.0.wp,
                        height: 10.0.wp,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0.wp),
                        ),
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: 90.0.wp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14.0.sp,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    readOnly: true,
                    controller: controller.locationController,
                    decoration: InputDecoration(
                      filled: true,
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.copyToClipBoard();
                        },
                        icon: const Icon(
                          Icons.copy,
                          color: Colors.grey,
                        ),
                      ),
                      fillColor: Colors.lightBlue.withOpacity(.2),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide: BorderSide.none),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.snackbar("title", "sdfhj");
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: Colors.blue),
                width: 30.0.wp,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Share",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0.sp,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
