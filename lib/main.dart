import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoday/ui/splash/splash_binding.dart';
import 'package:taoday/ui/splash/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TaoDay",
      home: const SplashPage(),
      initialBinding: SplashBinding(),
    );
  }
}
