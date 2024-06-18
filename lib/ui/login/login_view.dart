import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:taoday/core/utils/extensions.dart';
import 'package:taoday/core/utils/values.dart';
import 'package:taoday/core/widgets/google_button.dart';
import 'package:taoday/core/widgets/primary_button.dart';
import 'package:taoday/core/widgets/text_divider.dart';
import 'package:taoday/ui/login/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                Center(
                  child: Column(
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
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Log in",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 3.0.hp,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
            child: TextField(
              controller: controller.edtController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
              ],
              maxLines: 1,
              decoration: InputDecoration(
                hintText: "User name",
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.1),
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2.0.hp,
          ),
          PrimaryButton(
              press: () {
                controller.postUser().then((value) {
                  const CircularProgressIndicator();
                  if (value == true) {
                    controller.saveState();
                  } else {
                    Get.snackbar("Load failed", "Please login again!");
                  }
                });
              },
              title: "Log in as a Guest",
              mh: 8,
              mv: 2),
          SizedBox(
            height: 2.0.hp,
          ),
          Text(
            alertLogin,
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          SizedBox(
            height: 4.0.hp,
          ),
          const TextDivider(
            text: "or continue with",
          ),
          GoogleButton(
            press: () {},
            title: "Login",
            child: Image.asset(
              "assets/icons/icon_google.png",
              width: 10.0.wp,
            ),
          ),
          SizedBox(
            height: 2.0.hp,
          )
        ],
      ),
    );
  }
}
