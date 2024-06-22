import 'package:geocoding/geocoding.dart';

Future<String> getAddressFromLocation({required double latitude,required double longitude}) async {
  print("Start");
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