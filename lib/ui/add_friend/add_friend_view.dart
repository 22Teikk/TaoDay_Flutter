import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scan/scan.dart';
import 'package:screenshot/screenshot.dart';
import 'package:taoday/core/utils/common.dart';
import 'package:taoday/core/utils/extensions.dart';
import 'package:taoday/core/utils/values.dart';
import 'package:taoday/ui/add_friend/add_friend_controller.dart';

class AddFriendPage extends GetView<AddFriendController> {
  const AddFriendPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isFirst = Get.arguments ?? true;
    List<Widget> actions = [];
    if (isFirst) {
      actions.add(
        TextButton(
          onPressed: () {
            controller.skip();
          },
          child: Text(
            "Skip",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
              fontSize: 14.0.sp,
            ),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add Friend",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: actions,
      ),
      body: Obx(
        () => SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                ),
                Container(
                  width: 70.0.wp,
                  height: 70.0.wp,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Colors.grey.withOpacity(.3), width: 1.0),
                  ),
                  child: controller.isCheckCameraPermission.value
                      ? QRView(
                          key: controller.key,
                          onQRViewCreated: (p0) =>
                              controller.onQRViewCreated(p0))
                      : InkWell(
                          onTap: () => controller.requireCameraPermission(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                "assets/icons/icon_cam_permission.png",
                              ),
                              Text(
                                "Enable camera access to scan QR codes",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Enable",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14.0.sp,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  noteCamera,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0.sp,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? file =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (file != null) {
                      String? result = await Scan.parse(file.path);
                      if (result != null) {
                        controller.showDialogAdd(result);
                      } else {
                        Get.snackbar("Image is not valid",
                            "Please select image contain valid QR code!");
                      }
                    } else {}
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/icon_gallery.png",
                          width: 8.0.wp,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Center(
                          child: Text(
                            "Choose from album",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.0.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey.withOpacity(0.4),
                        thickness: 1.0,
                        endIndent: 20,
                        indent: 20,
                      ),
                    ),
                    const Text(
                      "or enter the code manually",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey.withOpacity(0.4),
                        thickness: 1.0,
                        endIndent: 20,
                        indent: 20,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 8.0.wp, vertical: 2.0.hp),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller.textEditingController,
                          decoration: InputDecoration(
                            hintText: "Enter code",
                            filled: true,
                            fillColor: Colors.blueGrey.withOpacity(0.6),
                            suffixIcon: InkWell(
                                onTap: () {
                                  controller.pasteData();
                                },
                                child: const Icon(Icons.paste)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          if (controller
                              .textEditingController.text.isNotEmpty) {
                            controller.showDialogAdd(
                                controller.textEditingController.text);
                          } else {
                            Get.snackbar("Error", "Please enter the code",
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                          ),
                          child: const Center(
                            child: Text(
                              "Add",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1.0,
                  color: Colors.grey,
                ),
                Text(
                  "Share your ID",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Screenshot(
                  controller: controller.screenshotController,
                  child: SizedBox(
                    width: 70.0.wp,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.grey.withOpacity(.4), width: 1.0)),
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: controller.user.value.qrCode,
                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                CircularProgressIndicator(value: downloadProgress.progress),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                          Positioned(
                            top: 0,
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: Image.asset(
                              "assets/icons/icon_app.webp",
                              width: 5.0.wp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 70.0.wp,
                  child: TextField(
                    textAlign: TextAlign.center,
                    readOnly: true,
                    controller: controller.textIdUser,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () {
                          copyToClipboard(controller.textIdUser.text);
                          Get.showSnackbar(
                            const GetSnackBar(
                              message: "Copy to clipboard",
                              duration: Durations.extralong3,
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.copy,
                          color: Colors.grey,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.blue.withOpacity(.3),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 70.0.wp,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => controller.saveWidgetAsImage(),
                          child: Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.5.hp, horizontal: 5.0.wp),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(.3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(
                                    Icons.save_alt,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 1.0.wp,
                                  ),
                                  Text(
                                    "Save",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0.sp,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () => controller.captureAndShare(),
                          child: Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.5.hp, horizontal: 5.0.wp),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(.3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(
                                    Icons.share,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 1.0.wp,
                                  ),
                                  Text(
                                    "Share",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0.sp,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ]),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
