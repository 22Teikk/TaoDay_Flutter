import 'package:flutter/material.dart';
import 'package:taoday/core/utils/extensions.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback press;
  final double mh, mv;
  final String title;
  final Color color;
  const PrimaryButton({
    super.key,
    required this.press,
    this.mh = 8,
    this.mv = 2,
    this.color = Colors.blue,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: mh.wp, vertical: mv.hp),
        padding: const EdgeInsets.all(8.0),
        height: 6.0.hp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0.hp),
          color: color,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
