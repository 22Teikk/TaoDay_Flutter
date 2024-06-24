import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taoday/core/utils/extensions.dart';
import 'package:taoday/core/widgets/primary_button.dart';
import 'package:taoday/ui/profile/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Profile'),
        ),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Obx(
              () => Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child:
                            ClipOval(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CachedNetworkImage(
                                  imageUrl: controller.user.value.avatar,
                                  placeholder: (context, url) => const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: IconButton(
                            splashColor: Colors.blue,
                            onPressed: () async {
                              final ImagePicker picker = ImagePicker();
                              final XFile? file = await picker.pickImage(
                                  source: ImageSource.gallery);
                              if (file != null) {
                                controller.updateImageProfile(file.path);
                              }
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 90.0.wp,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14.0.sp,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          readOnly: !controller.isEnable.value,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          controller: controller.nameController,
                          focusNode: controller.focusNode,
                          decoration: InputDecoration(
                            filled: true,
                            suffixIcon: InkWell(
                              onTap: () {
                                controller.enableChangeName();
                              },
                              child: const Icon(
                                Icons.edit,
                                color: Colors.grey,
                              ),
                            ),
                            fillColor: Colors.lightBlue.withOpacity(.2),
                            border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide.none),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 90.0.wp,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Current Location",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14.0.sp,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: controller.locationController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.lightBlue.withOpacity(.2),
                            border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide.none),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  controller.user.value.email != "" ?
                  SizedBox(
                    width: 90.0.wp,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14.0.sp,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: controller.emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.lightBlue.withOpacity(.2),
                            border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide.none),
                          ),
                        )
                      ],
                    ),
                  ) : const Spacer(),
                  const Spacer(),
                  controller.isEnable.value
                      ? PrimaryButton(press: () {}, title: "UPDATE")
                      : const Spacer(),
                ],
              ),
            ),
          ),
        ));
  }
}
