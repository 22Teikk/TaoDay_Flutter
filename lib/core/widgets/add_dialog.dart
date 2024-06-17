import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoday/core/utils/extensions.dart';
import 'package:taoday/core/widgets/primary_button.dart';
import 'package:taoday/data/model/ralationship.dart';

class AddDialog extends StatelessWidget {
  final Relationship userRelationShip;
  final Function(bool) callback;
  const AddDialog({
    super.key,
    required this.userRelationShip,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(userRelationShip.avatar),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    userRelationShip.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
              child: const Center(
                child: Text(
                  "Become friend to track location together",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    press: () {
                      Get.back();
                      callback(false);
                    },
                    title: "Cancel",
                    mh: 0,
                    mv: 0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: PrimaryButton(
                    press: () {
                      Get.back();
                      callback(true);
                    },
                    title: "OK",
                    mh: 0,
                    mv: 0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
