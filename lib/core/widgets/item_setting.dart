import 'package:flutter/material.dart';
import 'package:taoday/core/utils/extensions.dart';

class ItemSetting extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback press;
  const ItemSetting({
    super.key,
    required this.icon,
    required this.title,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
            ),
          ),
          SizedBox(
            width: 2.0.wp,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0.sp,
            ),
          ),
        ],
      ),
    );
  }
}
