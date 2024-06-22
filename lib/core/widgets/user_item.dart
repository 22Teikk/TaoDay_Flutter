import 'package:flutter/material.dart';
import 'package:taoday/core/utils/extensions.dart';

class UserItem extends StatelessWidget {
  final String image, name, location;
  const UserItem({
    super.key,
    required this.image,
    required this.name,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10.0,
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.asset(image),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 14.0.sp,
              ),
            ),
            Text(
              location,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.0.sp,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share_location_rounded),
        ),
      ],
    );
  }
}
