import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<String> getAddressFromLocation({required double latitude,required double longitude}) async {
  String result = '';
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      result = "${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.country}";
      print(result);
    }
  } catch (e) {
    print(e);
  }
  return result;
}

Future<String> getCorrectAddressFromLocation({required double latitude, required double longitude}) async {
  String result = '';
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];

      List<String> addressParts = [];

      if (place.street != null && place.street!.isNotEmpty) addressParts.add(place.street!);
      if (place.subLocality != null && place.subLocality!.isNotEmpty) addressParts.add(place.subLocality!);
      if (place.locality != null && place.locality!.isNotEmpty) addressParts.add(place.locality!);
      if (place.subAdministrativeArea != null && place.subAdministrativeArea!.isNotEmpty) addressParts.add(place.subAdministrativeArea!);
      if (place.administrativeArea != null && place.administrativeArea!.isNotEmpty) addressParts.add(place.administrativeArea!);
      if (place.postalCode != null && place.postalCode!.isNotEmpty) addressParts.add(place.postalCode!);
      if (place.country != null && place.country!.isNotEmpty) addressParts.add(place.country!);

      result = addressParts.join(', ');
      print(result);
    }
  } catch (e) {
    print(e);
  }
  return result;
}

Future<LatLng?> getLocationFromAddress(String address) async {
  try {
    List<Location> locations = await locationFromAddress(address);
    if (locations.isNotEmpty) {
      Location loc = locations.first;
      return LatLng(loc.latitude, loc.longitude);
    }
  } catch (e) {
    return null;
  }
  return null;
}

Future<BitmapDescriptor?> LoadMarkerIcon(String url) async {
  final markerImage = await _loadNetworkImage(url);
  if (markerImage != null) {
    return markerImage;
  }
  return null;
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
