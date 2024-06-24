import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoday/core/utils/extensions.dart';
import 'package:taoday/core/widgets/primary_button.dart';

class EmptyDialog extends StatelessWidget {
  const EmptyDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5.0,
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Caution",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Divider(
              thickness: 2,
              indent: 5.0.wp,
              endIndent: 5.0.wp,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: Text(
                "Your emergency list must have at least one person!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0.sp,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            PrimaryButton(
              press: () {
                Get.back();
              },
              title: "OK",
              mh: 5.0.wp,
            ),
          ],
        ),
      ),
    );
  }
}
