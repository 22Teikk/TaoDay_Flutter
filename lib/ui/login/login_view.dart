import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:taoday/core/utils/extensions.dart';
import 'package:taoday/core/utils/values.dart';
import 'package:taoday/core/widgets/primary_button.dart';
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
                controller.postUser();
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
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 3.0.wp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                      color: Colors.grey.withOpacity(0.3),
                      thickness: 2, // độ dày của đường kẻ
                      indent: 20, // khoảng cách từ bên trái
                      endIndent: 20),
                ),
                Text(
                  "or continue with",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                Expanded(
                  child: Divider(
                      color: Colors.grey.withOpacity(0.3),
                      thickness: 2, // độ dày của đường kẻ
                      indent: 20, // khoảng cách từ bên trái
                      endIndent: 20),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 8.0.wp, vertical: 3.0.hp),
            height: 6.0.hp,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.2),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0.hp),
              color: Colors.transparent,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/icons/icon_google.png",
                    width: 10.0.wp,
                  ),
                ),
                Center(
                  child: Text(
                    "Google",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
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
