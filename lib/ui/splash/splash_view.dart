import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:taoday/core/utils/extensions.dart';
import 'package:taoday/core/utils/routes.dart';
import 'package:taoday/data/service/permission_service.dart';
import 'package:taoday/ui/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      controller.checkFirst().then((value) => {
            if (value)
              {Get.offNamed(policyPage)}
            else
              {
                controller.checkLogin().then((isLogin) async {
                  if (isLogin) {
                    controller.checkFirstLogin().then((firstLogin) {
                      if (firstLogin) {
                        Get.offNamed(addFriendPage);
                      } else {
                        Get.offNamed(homePage);
                      }
                    });
                  } else {
                    if (await checkNotificationPermission() == false) {
                      Get.offNamed(permissionOnePage);
                    } else if (await checkLocationPermission() == false) {
                      Get.offNamed(permissionTwoPage);
                    } else if (await checkBatteryPermission() == false) {
                      Get.offNamed(permissionThreePage);
                    } else if (await checkBackgroundPermission() == false) {
                      Get.offNamed(permissionFourPage);
                    } else {
                      Get.offNamed(loginPage);
                    }
                  }
                })
              }
          });
    });
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset("assets/images/img_background.png",
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.fill),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/app_name.png",
                      width: 70.0.wp,
                    ),
                    SizedBox(height: 1.0.hp),
                    Text(
                      "Location Tracker",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0.hp),
                  ],
                )
              ],
            ),
          ),
          Lottie.asset("assets/anim/splash.json",
              height: 40.0.wp, width: 40.0.wp),
        ],
      ),
    );
  }
}
