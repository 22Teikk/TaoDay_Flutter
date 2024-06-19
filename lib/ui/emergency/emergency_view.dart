import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:taoday/core/utils/extensions.dart';
import 'package:taoday/ui/emergency/emergency_controller.dart';

class EmergencyPage extends GetView<EmergencyController> {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "EMERGENCY LIST",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 14.0.sp,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Get.back(result: );
            },
            child: Text(
              "OK",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(.4),
                ),
                width: 90.0.wp,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    alignLabelWithHint: false,
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                child: Material(
                  elevation: 1.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 90.0.wp,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.asset("assets/images/app_name.png"),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Kiet nt",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0.sp,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/icons/icon_show.png",
                            width: 5.0.wp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
