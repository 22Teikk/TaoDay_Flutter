import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taoday/core/utils/extensions.dart';
import 'package:taoday/ui/home/home_view.dart';
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
      body: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Container(
            color: Colors.black,
            height: 40.0.hp,
            child: Stack(
              children: [
                const GoogleMap(
                  initialCameraPosition: HomePage.kLake,
                  zoomControlsEnabled: false,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchBar(
                    hintText: "Search...",
                    keyboardType: TextInputType.streetAddress,
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0)),
                    onTap: () {},
                    onChanged: (_) {},
                    leading: const Icon(Icons.search),
                  ),
                ),
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
                  decoration: InputDecoration(
                    filled: true,
                    suffixIcon: IconButton(
                      onPressed: () {},
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
          Container(
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
          )
        ],
      ),
    );
  }
}
