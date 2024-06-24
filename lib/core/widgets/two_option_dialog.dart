import 'package:flutter/material.dart';
import 'package:taoday/core/utils/extensions.dart';
import 'package:taoday/core/widgets/primary_button.dart';

class TwoOptionDialog extends StatelessWidget {
  const TwoOptionDialog({
    super.key,
    required this.callback,
    required this.title,
    required this.content,
    required this.cancel,
    required this.oke,
  });

  final Function(bool) callback;
  final String title, content, cancel, oke;

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
              title,
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
                content,
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
            SizedBox(
              width: 70.0.wp,
              child: Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      press: () {
                        callback(false);
                      },
                      color: Colors.grey,
                      mh: 0,
                      title: cancel,
                    ),
                  ),
                  SizedBox(
                    width: 5.0.wp,
                  ),
                  Expanded(
                    child: PrimaryButton(
                      press: () {
                        callback(true);
                      },
                      mh: 0,
                      title: oke,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
