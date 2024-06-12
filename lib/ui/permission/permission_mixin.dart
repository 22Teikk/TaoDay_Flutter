import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoday/core/utils/extensions.dart';

mixin PermissionMixin on GetxController {
  Widget buildUI({
    required VoidCallback press,
    required String title,
    required String content,
    required String image,
  }) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.0.hp,
            ),
            Image.asset(
              image,
              height: 20.0.hp,
            ),
            SizedBox(
              height: 2.0.hp,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(5.0.wp),
                child: Text(
                  content,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0.sp,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: press,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0.wp),
                ),
                width: 80.0.wp,
                height: 6.0.hp,
                child: Center(
                  child: Text(
                    "Allow",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0.sp,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.0.hp),
          ],
        ),
      ),
    );
  }
}
