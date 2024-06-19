import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:taoday/core/utils/extensions.dart';
import 'package:taoday/core/utils/routes.dart';
import 'package:taoday/core/utils/values.dart';
import 'package:taoday/ui/sos/sos_controller.dart';

class SosPage extends GetView<SosController> {
  const SosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.close),
        ),
        centerTitle: true,
        title: Text(
          "SOS",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 16.0.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                sosPre,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.0.sp,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              LottieBuilder.asset(
                "assets/anim/count_down_sos.json",
                height: 20.0.hp,
                repeat: false,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 90.0.wp,
                child: Divider(
                  color: Colors.grey.withOpacity(.8),
                  thickness: 1.0,
                ),
              ),
              SizedBox(
                width: 90.0.wp,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Emergency list",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    IntrinsicHeight(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(.3),
                          borderRadius: BorderRadius.circular(10.0.wp),
                        ),
                        child: TextButton(
                          onPressed: () async{
                            var result = await Get.toNamed(emergencyPage);
                            if (result != null) {

                            } else {
                              
                            }
                          },
                          child: Text(
                            "Custom",
                            style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 90.0.wp,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.asset("assets/icons/icon_google.png"),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Kiet nt",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.w500,
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
