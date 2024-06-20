import 'dart:async';
import 'dart:typed_data';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image/image.dart' as img;

class HomeController extends GetxController {
  late GoogleMapController mapController;
  var type = MapType.normal.obs;
  var markerIcon = Rx<BitmapDescriptor>(BitmapDescriptor.defaultMarker);

  @override
  void onInit() {
    super.onInit();
    _setMarkerIcon();
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

  Future<void> _setMarkerIcon() async {
    const imageUrl = 'http://test.hihoay.io:8003//static//avatars/ic-01.png';
    final markerImage = await _loadNetworkImage(imageUrl);
    if (markerImage != null) {
      markerIcon.value = markerImage;
    }
  }

  Future<BitmapDescriptor?> _loadNetworkImage(String imageUrl) async {
    int size = 100;
    final file = await DefaultCacheManager().getSingleFile(imageUrl);
    final Uint8List bytes = await file.readAsBytes();
    img.Image image = img.decodeImage(bytes)!;
    img.Image resizedImage = img.copyResize(image, width: size, height: size);
    Uint8List resizedBytes = img.encodePng(resizedImage);
    return BitmapDescriptor.fromBytes(resizedBytes);
  }

  void checkUserLocation() {
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      const CameraPosition(
        bearing: 0,
        target: LatLng(-33.86, 151.20),
        zoom: 17.0,
      ),
    ));
  }
}
