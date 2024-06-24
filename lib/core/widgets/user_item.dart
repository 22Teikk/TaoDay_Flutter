import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taoday/core/utils/extensions.dart';
import 'package:taoday/data/service/location_service.dart';

import '../../data/model/user.dart';
import '../../ui/home/home_controller.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    super.key,
    required this.user, required this.controller,
    this.isMe = false
  });

  final User user;
  final HomeController controller;
  final isMe;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.zero,
      elevation: 0,
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        onTap: () {},
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: user.avatar,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isMe ?
              "${user.name} (me)" : user.name
            , style: TextStyle(
              color: Colors.black,
              fontSize: 14.0.sp,
              fontWeight: FontWeight.w500,
            ),
            ),
            FutureBuilder(
              future: getAddressFromLocation(latitude: user.latitude, longitude: user.longitude),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Text('Error loading address');
                } else {
                  return Text(snapshot.data ?? 'No address available');
                }
              },
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () => controller.moveToUserLocation(LatLng(user.latitude, user.longitude)),
          icon: const Icon(Icons.location_on_outlined),
        ),
        selectedTileColor: Colors.grey[200],
      ),
    );
  }
}
