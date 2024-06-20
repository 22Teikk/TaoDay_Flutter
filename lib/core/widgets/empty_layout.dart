import 'package:flutter/material.dart';
import 'package:taoday/core/utils/extensions.dart';

class EmptyLayout extends StatelessWidget {
  final String img;
  final String title;
  const EmptyLayout({
    super.key,
    required this.img,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5.0.hp,
        ),
        Image.asset(
          img,
          height: 20.0.hp,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey.withOpacity(.7),
            fontSize: 12.0.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
