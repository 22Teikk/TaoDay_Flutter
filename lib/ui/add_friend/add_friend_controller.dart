import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taoday/core/utils/common.dart';
import 'package:taoday/core/utils/constant.dart';
import 'package:taoday/core/utils/routes.dart';
import 'package:taoday/core/widgets/add_dialog.dart';
import 'package:taoday/data/model/enum/friendship_status.dart';
import 'package:taoday/data/model/ralationship.dart';
import 'package:taoday/data/provider/sqlite_provider.dart';
import 'package:taoday/data/service/api_service.dart';
import '../../data/model/user.dart';

class AddFriendController extends GetxController {
  ScreenshotController screenshotController = ScreenshotController();
  GlobalKey key = GlobalKey();
  QRViewController? qrController;
  TextEditingController textIdUser = TextEditingController();
  TextEditingController textEditingController = TextEditingController();
  final SqliteProvider db;
  late SharedPreferences pref;
  final ApiService apiService;
  late String uid;
  var isCheckCameraPermission = false.obs;
  var user = User().obs;

  AddFriendController({required this.db, required this.apiService});
  @override
  void onInit() {
    super.onInit();
    fetchDataFromLocal();
    checkCameraPermission();
  }

  void fetchDataFromLocal() async {
    pref = await SharedPreferences.getInstance();
    uid = pref.getString(UID)!;
    user.value = (await db.getUserbyID(uid))!;
    textIdUser.text = user.value.idFriendship;
  }

  void skip() async {
    Get.offNamed(homePage);
  }

  void pasteData() async {
    String text = await getClipboardText();
    textEditingController.text = text;
  }

  void checkCameraPermission() async {
    Permission.camera.isGranted.then((value) {
      if (value == true) {
        isCheckCameraPermission.value = true;
      } else {
        isCheckCameraPermission.value = false;
      }
    });
  }

  void requireCameraPermission() async {
    Permission.camera.request().then((value) {
      if (value == PermissionStatus.granted) {
        isCheckCameraPermission.value = true;
      } else {
        isCheckCameraPermission.value = false;
      }
    });
  }

  void onQRViewCreated(QRViewController controller) {
    qrController = controller;
    qrController!.scannedDataStream.listen((scanData) {
      showDialogAdd(scanData.toString());
    });
  }

  void showDialogAdd(String idFound) async {
    Relationship? userFriendShip = await apiService.getRalationSipByID(idFound);
    qrController?.pauseCamera();
    if (userFriendShip != null) {
      Get.dialog(
        AddDialog(
          userRelationShip: userFriendShip,
          callback: (p0) {
            if (p0 == true) {
              var relationShip = Relationship(
                  fromIdFriendship: user.value.idFriendship,
                  toIdFriendship: userFriendShip.idFriendship,
                  friendshipStatus: FriendshipStatus.REQUEST);
              apiService.createRelationship(relationShip);
            }
          },
        ),
      );
    } else {
      Get.snackbar(
        "Error",
        "Friendship not found",
      );
    }
    qrController?.resumeCamera();
  }

  @override
  void onClose() {
    qrController?.dispose();
    super.onClose();
  }

  void saveWidgetAsImage() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      String path = directory.path;
      String name = DateTime.now().millisecondsSinceEpoch.toString();
      String fileName = "TaoDay_$name.png";
      await screenshotController.captureAndSave(path, fileName: fileName);
      await GallerySaver.saveImage("$path/$fileName",
          albumName: "MyScreenshots");
      Get.snackbar("Save successfully", "Your image is saved in the gallery!",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Something error", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void captureAndShare() async {
    Uint8List? imageBytes = await screenshotController.capture();
    if (imageBytes != null) {
      await Share.shareXFiles(
        [
          XFile.fromData(imageBytes,
              mimeType: 'image/png', name: 'screenshot.png')
        ],
        text: 'Check out my screenshot!',
      );
    } else {
      Get.snackbar("Something error", "Share the image failed",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
