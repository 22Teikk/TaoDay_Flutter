import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taoday/data/service/location_service.dart';

class HomeController extends GetxController {
  late GoogleMapController mapController;
  var type = MapType.normal.obs;
  var markerIcon = Rx<BitmapDescriptor>(BitmapDescriptor.defaultMarker);

  @override
  void onInit() {
    super.onInit();
    setMarkerUI();
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


  void checkUserLocation() {
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      const CameraPosition(
        bearing: 0,
        target: LatLng(-33.86, 151.20),
        zoom: 17.0,
      ),
    ));
  }

  void setMarkerUI() async{
    var marker = await LoadMarkerIcon("");
    if (marker != null) {
      markerIcon.value = marker;
    }
  }
}
