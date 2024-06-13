import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoday/core/utils/routes.dart';
import 'package:taoday/ui/home/home_binding.dart';
import 'package:taoday/ui/home/home_view.dart';
import 'package:taoday/ui/login/login_binding.dart';
import 'package:taoday/ui/login/login_view.dart';
import 'package:taoday/ui/permission/permission_binding.dart';
import 'package:taoday/ui/permission/permission_four_view.dart';
import 'package:taoday/ui/permission/permission_one_view.dart';
import 'package:taoday/ui/permission/permission_three_view.dart';
import 'package:taoday/ui/permission/permission_two_view.dart';
import 'package:taoday/ui/policy/policy_binding.dart';
import 'package:taoday/ui/policy/policy_view.dart';
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
      initialBinding: SplashBinding(),
      initialRoute: splashPage,
      getPages: [
        GetPage(
          name: splashPage,
          page: () => const SplashPage(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: policyPage,
          page: () => const PolicyPage(),
          binding: PolicyBinding(),
        ),
        GetPage(
            name: permissionOnePage,
            page: () => const PermissionOnePage(),
            binding: PermissionBinding(),
            transition: Transition.rightToLeft),
        GetPage(
            name: permissionTwoPage,
            page: () => const PermissionTwoPage(),
            binding: PermissionBinding(),
            transition: Transition.rightToLeft),
        GetPage(
            name: permissionThreePage,
            page: () => const PermissionThreePage(),
            binding: PermissionBinding(),
            transition: Transition.rightToLeft),
        GetPage(
            name: permissionFourPage,
            page: () => const PermissionFourPage(),
            binding: PermissionBinding(),
            transition: Transition.rightToLeft),
        GetPage(
          name: loginPage,
          page: () => const LoginPage(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: homePage,
          page: () => const HomePage(),
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
