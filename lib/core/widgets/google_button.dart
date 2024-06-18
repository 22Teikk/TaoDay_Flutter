import 'package:flutter/material.dart';
import 'package:taoday/core/utils/extensions.dart';

class GoogleButton extends StatelessWidget {
  final Widget child;
  final VoidCallback press;
  final String title;
  const GoogleButton({
    super.key,
    required this.child,
    required this.press,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
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
            Padding(padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10), child: child),
            Center(
              child: Text(
                title,
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
    );
  }
}
