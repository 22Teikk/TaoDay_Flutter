import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoday/core/utils/extensions.dart';
import 'package:taoday/core/utils/routes.dart';
import 'package:taoday/core/widgets/google_button.dart';
import 'package:taoday/core/widgets/item_setting.dart';
import 'package:taoday/core/widgets/text_divider.dart';
import 'package:taoday/core/widgets/two_option_dialog.dart';
import 'package:taoday/ui/setting/setting_controller.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20.0.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  onTap: () => Get.toNamed(profilePage),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.0.wp),
                    margin: EdgeInsets.symmetric(vertical: 1.0.hp),
                    width: 90.0.wp,
                    height: 8.0.hp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffff0f7f9),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CachedNetworkImage(
                              imageUrl: controller.user.value.avatar,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      CircularProgressIndicator(
                                          value: downloadProgress.progress),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.0.wp,
                        ),
                        Text(
                          "Your Profile",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.0.wp),
                  margin: EdgeInsets.symmetric(vertical: 1.0.hp),
                  width: 90.0.wp,
                  height: 8.0.hp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffff0f7f9),
                  ),
                  child: ItemSetting(
                    press: () {},
                    icon: Icons.question_mark_rounded,
                    title: "FAQs",
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 1.0.hp),
                    width: 90.0.wp,
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.0.wp, vertical: 2.0.hp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffff0f7f9),
                        ),
                        child: Column(
                          children: [
                            ItemSetting(
                              press: () {},
                              icon: Icons.language,
                              title: "Language",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ItemSetting(
                              press: () {},
                              icon: Icons.star_border_rounded,
                              title: "Rate Us",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ItemSetting(
                              press: () {},
                              icon: Icons.feedback_outlined,
                              title: "Feedback",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ItemSetting(
                              press: () {},
                              icon: Icons.policy,
                              title: "Privacy Policy",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GoogleButton(
                  press: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return TwoOptionDialog(
                          cancel: "Cancel",
                          oke: "OK",
                          title: "Log out",
                          content: "Are you sure to log out? If you log out as a Guest, your current data will be lost. To save your data, sign in with Google now. Your data will be transferred and saved to your new account.",
                          callback: (isDone) {
                            if (isDone) {

                            }
                            Get.back();
                          },
                        );
                      },
                    );
                  },
                  title: "Log out",
                  child: Icon(
                    Icons.logout,
                    size: 10.0.wp,
                  ),
                ),
                const TextDivider(
                  text: "continue with",
                ),
                GoogleButton(
                  press: () {},
                  title: "Google",
                  child: Image.asset(
                    "assets/icons/icon_google.png",
                    width: 10.0.wp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
