import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  var type = MapType.normal.obs;

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
}
