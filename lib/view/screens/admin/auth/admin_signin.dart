import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:task_manager/core/app_routes.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';
import 'package:task_manager/view/screens/admin/auth/controller/admin_auth_controller.dart';
import 'package:task_manager/view/widget/custom_button.dart';
import 'package:task_manager/view/widget/custom_text.dart';
import 'package:task_manager/view/widget/custom_text_field.dart';

class AdminSignin extends StatelessWidget {
  AdminSignin({super.key});
  final AdminAuthController adminAuthController =
      Get.find<AdminAuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackyDarker,
      body: Obx(() {
        return Center(
          child: Column(
            children: [
              //=============================== Email Field =================================

              CustomText(text: "Email"),
              SizedBox(
                height: 8.h,
              ),
              CustomTextField(
                textEditingController:
                    adminAuthController.emailController.value,
              ),

              //=============================== Password Field =================================

              CustomText(text: "Password"),
              SizedBox(
                height: 8.h,
              ),
              CustomTextField(
                textEditingController: adminAuthController.passController.value,
              ),
              SizedBox(
                height: 20.h,
              ),

              adminAuthController.isLoading.value
                  ? CircularProgressIndicator()
                  : CustomButton(
                      onTap: () {
                        adminAuthController.signInAdmin();
                      },
                      title: "Sign In",
                    ),

              SizedBox(
                height: 40.h,
              ),

              Row(
                children: [
                  CustomText(text: "Don't have a account?"),
                  Expanded(
                      child: CustomButton(
                    onTap: () {
                      Get.toNamed(AppRoute.adminSignUp);
                    },
                    title: "Sign Up",
                  ))
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
