import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoday/core/utils/extensions.dart';
import 'package:taoday/ui/permission/permission_binding.dart';
import 'package:taoday/ui/permission/permission_one_view.dart';
import 'package:taoday/ui/policy/policy_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PolicyPage extends GetView<PolicyController> {
  const PolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Privacy Policy",
            style: TextStyle(color: Colors.blue, fontSize: 20.0.sp),
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => Column(
            children: [
              Expanded(
                child: WebViewWidget(controller: controller.webViewController),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: controller.isSelected.value,
                    onChanged: controller.isDone.value == true
                        ? (bool? value) {
                            controller.setSelected(value);
                          }
                        : null,
                    activeColor: Colors.blue,
                  ),
                  Text(
                    "I agree to Privacy Policy.",
                    style: TextStyle(
                      fontSize: 14.0.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.0.hp,
              ),
              InkWell(
                onTap: controller.isSelected.value
                    ? () {
                        controller.setNotFirst();
                        Get.off(() => const PermissionOnePage(),
                            binding: PermissionBinding());
                      }
                    : null,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color:
                        controller.isSelected.value ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(10.0.wp),
                  ),
                  width: 80.0.wp,
                  height: 6.0.hp,
                  child: Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0.sp,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.0.hp),
            ],
          ),
        ));
  }
}
