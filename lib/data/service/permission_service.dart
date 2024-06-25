import 'package:permission_handler/permission_handler.dart';

Future<bool> checkNotificationPermission() async {
  var result = await Permission.notification.isGranted.then((value) {
    return value;
  });
  return result;
}

Future<bool> checkLocationPermission() async {
  var result = await Permission.location.isGranted.then((value) => value);
  return result;
}

Future<bool> checkBatteryPermission() async {
  var result = await Permission.ignoreBatteryOptimizations.isGranted
      .then((value) => value);
  return result;
}

Future<bool> checkBackgroundPermission() async {
  var result = await Permission.locationAlways.isGranted.then((value) => value);
  return result;
}
