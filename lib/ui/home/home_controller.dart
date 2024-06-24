import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taoday/core/utils/constant.dart';
import 'package:taoday/data/provider/sqlite_provider.dart';
import 'package:taoday/data/service/location_service.dart';

import '../../data/model/user.dart';

class HomeController extends GetxController {
  var markers = <Marker>[].obs;
  var currentPosition =
      const CameraPosition(target: LatLng(-33.86, 151.20), zoom: 15).obs;
  final SqliteProvider db;
  late SharedPreferences pref;
  late GoogleMapController mapController;
  final TextEditingController searchController = TextEditingController();
  final DraggableScrollableController draggableController = DraggableScrollableController();
  var type = MapType.normal.obs;
  var user = User().obs;
  var isMaxSize = false.obs;
  var markerIcon = Rx<BitmapDescriptor>(BitmapDescriptor.defaultMarker);

  final List<User> listUser = [
    User(
      idUser: 'user1',
      idGoogle: 'google1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      avatar: 'http://test.hihoay.io:8004/static/qrcode/97EC6C.png',
      status: 'Online',
      qrCode: 'QR1',
      uniqueID: 'UID1',
      session: 'Session1',
      latitude: 37.7749,
      longitude: -122.4194,
      rotation: 0.0,
      friendshipStatus: 'Friends',
      idFriendship: 'friendship1',
      idAvatar: 'avatar1',
    ),
    User(
      idUser: 'user2',
      idGoogle: 'google2',
      name: 'Jane Smith',
      email: 'jane.smith@example.com',
      avatar: 'https://example.com/avatar2.jpg',
      status: 'Offline',
      qrCode: 'QR2',
      uniqueID: 'UID2',
      session: 'Session2',
      latitude: 34.0522,
      longitude: -118.2437,
      rotation: 0.0,
      friendshipStatus: 'Pending',
      idFriendship: 'friendship2',
      idAvatar: 'avatar2',
    ),
    User(
      idUser: 'user3',
      idGoogle: 'google3',
      name: 'Alice Johnson',
      email: 'alice.johnson@example.com',
      avatar: 'http://test.hihoay.io:8004/static/qrcode/97EC6C.png',
      status: 'Away',
      qrCode: 'QR3',
      uniqueID: 'UID3',
      session: 'Session3',
      latitude: 40.7128,
      longitude: -74.0060,
      rotation: 0.0,
      friendshipStatus: 'Blocked',
      idFriendship: 'friendship3',
      idAvatar: 'avatar3',
    ),
  ];

  HomeController({required this.db});

  @override
  void onInit() {
    super.onInit();
    observerScroll();
    getUserFromLocal();
  }

  void getUserFromLocal() async {
    pref = await SharedPreferences.getInstance();
    String uid = pref.getString(UID).toString();
    user.value = (await db.getUserbyID(uid))!;
    loadMarker();

  }

  void loadMarker() async {
    var icon = await LoadMarkerIcon(user.value.avatar);
    markers.add(
      Marker(
        markerId: MarkerId(user.value.idUser),
        anchor: const Offset(0.5, 1),
        icon: icon!,
        position: LatLng(user.value.latitude, user.value.longitude),
      ),
    );
    listUser.forEach((element) async {
      var icon = await LoadMarkerIcon(element.avatar);
      markers.add(
        Marker(
          markerId: MarkerId(element.idUser),
          anchor: const Offset(0.5, 1),
          icon: icon!,
          position: LatLng(element.latitude, element.longitude),
        ),
      );
    });
  }

  final List<MapType> mapTypes = [
    MapType.normal,
    MapType.satellite,
    MapType.hybrid,
    MapType.terrain,
  ];

  void changeMapType() {
    int currentIndex = mapTypes.indexOf(type.value);
    if (currentIndex == mapTypes.length - 1) {
      type.value = mapTypes[0];
    } else {
      type.value = mapTypes[currentIndex + 1];
    }
  }

  void moveToUserLocation(LatLng latLng) {
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: latLng,
        zoom: 17.0,
      ),
    ));
  }

  void onMapCreated(GoogleMapController controllerMap) {
    mapController = controllerMap;
    moveToCurrentLocation();
  }

  void moveToCurrentLocation() {
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(user.value.latitude, user.value.longitude),
        zoom: 17.0,
      ),
    ));
  }

  void observerScroll() {
    draggableController.addListener(() {
      if (draggableController.size >= 0.45) {
        isMaxSize.value = true;
      } else {
        isMaxSize.value = false;
      }
    });
  }

}
