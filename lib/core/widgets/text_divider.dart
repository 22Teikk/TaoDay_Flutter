import 'package:flutter/material.dart';
import 'package:taoday/core/utils/extensions.dart';

class TextDivider extends StatelessWidget {
  final String text;
  const TextDivider({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            text,
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
    );
  }
}
