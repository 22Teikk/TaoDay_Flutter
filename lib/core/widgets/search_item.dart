import 'package:flutter/material.dart';
import 'package:taoday/core/utils/extensions.dart';

class SearchWidget extends StatelessWidget {
  final String title;
  final bool isIcon;
  const SearchWidget({
    super.key,
    required this.title,
    this.isIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(.4),
      ),
      width: 90.0.wp,
      height: 5.5.hp,
      child: TextField(
        decoration: InputDecoration(
          hintText: title,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          alignLabelWithHint: false,
          contentPadding: EdgeInsets.symmetric(vertical: (5.0.hp - 24) / 2),
          prefixIcon: isIcon ? const Icon(Icons.search) : null,
        ),
      ),
    );
  }
}
