import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/common.dart';
import '../../core/utils/constant.dart';
import '../../data/model/user.dart';
import '../../data/provider/sqlite_provider.dart';
import '../../data/service/location_service.dart';

class ShareController extends GetxController {
  var markers = <Marker>[].obs;
  TextEditingController locationController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  var isEmptySearch = true.obs;
  late GoogleMapController mapController;
  late SharedPreferences pref;
  final SqliteProvider db;

  var user = User().obs;
  var currentPosition =
      const CameraPosition(target: LatLng(-33.86, 151.20), zoom: 15).obs;
  late double lat, long;

  ShareController({required this.db});

  @override
  void onInit() {
    super.onInit();
    getUserFromLocal();
  }

  void getUserFromLocal() async {
    pref = await SharedPreferences.getInstance();
    String uid = pref.getString(UID).toString();
    user.value = (await db.getUserbyID(uid))!;
    lat = user.value.latitude;
    long = user.value.longitude;
    var icon = await LoadMarkerIcon(user.value.avatar);
    markers.add(
      Marker(
          markerId: MarkerId(user.value.idUser),
          anchor: const Offset(0.5, 1),
          icon: icon,
          position: LatLng(lat, long)),
    );
    locationController.text =
        await getCorrectAddressFromLocation(latitude: lat, longitude: long);
    currentPosition.value = CameraPosition(target: LatLng(lat, long), zoom: 15);
  }

  void moveToCurrentLocation() {
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(lat, long),
        zoom: 17.0,
      ),
    ));
  }

  void onMapCreated(GoogleMapController controllerMap) {
    mapController = controllerMap;
    moveToCurrentLocation();
  }

  void findLocation(LatLng? latLng) async {
    if (latLng != null) {
      String address = searchController.text.trim();
      LatLng? location = await getLocationFromAddress(address);
      if (location != null) {
        latLng = LatLng(location.latitude, location.longitude);
      }
    }
    if (latLng != null) {
      markers.add(Marker(
          markerId: const MarkerId("MarkerFind"),
          anchor: const Offset(0.5, 1),
          icon: BitmapDescriptor.defaultMarker,
          position: latLng));
      mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: latLng,
          zoom: 17.0,
        ),
      ));
      locationController.text = await getCorrectAddressFromLocation(latitude: latLng.latitude, longitude: latLng.longitude);
    } else {
      Get.snackbar("Error", "Could not find location", snackPosition: SnackPosition.BOTTOM);
    }
  }

  void copyToClipBoard() {
    copyToClipboard(locationController.text);
  }
}
