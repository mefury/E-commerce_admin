import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';
import 'package:task_manager/view/screens/admin/admin_controller/admin_controller.dart';
import 'package:task_manager/view/widget/custom_button.dart';
import 'package:task_manager/view/widget/custom_text.dart';
import 'package:task_manager/view/widget/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/view/widget/network_image.dart';

class BannerScreen extends StatelessWidget {
  BannerScreen({super.key});

  final AdminHomeController adminHomeController =
      Get.find<AdminHomeController>();

  final Stream<QuerySnapshot> _bannerCollaction =
      FirebaseFirestore.instance.collection('banners').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return StatefulBuilder(builder: (context, setState) {
                return AlertDialog(
                  content: Column(
                    children: [
                      adminHomeController.fileBytes.value.isEmpty
                          ? GestureDetector(
                              onTap: () {
                                debugPrint(
                                    "Picked Image======================>>>>>>> ");

                                adminHomeController.pickFile().then((_) {
                                  setState(() {});
                                });
                              },
                              child: Container(
                                height: 200.h,
                                width: 300.w,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.blackyDark),
                                ),
                                child: Icon(Icons.image),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                debugPrint(
                                    "Picked Image======================>>>>>>> ");

                                adminHomeController.pickFile().then((_) {
                                  setState(() {});
                                });
                              },
                              child: Container(
                                  height: 200.h,
                                  width: 300.w,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColors.blackyDark),
                                  ),
                                  child: Image.memory(
                                      adminHomeController.fileBytes.value)),
                            ),
                      Gap(16.h),
                      CustomTextField(
                        textEditingController:
                            adminHomeController.bannerName.value,
                        fillColor: AppColors.blackyDark,
                      ),
                      Gap(24.h),
                      CustomButton(
                        fillColor: AppColors.blackyDark,
                        onTap: () {
                          adminHomeController.saveBanner();
                        },
                        title: "Save",
                      )
                    ],
                  ),
                );
              });
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: _bannerCollaction,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          var data = snapshot.data!.docs;

          return GridView.builder(
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CustomNetworkImage(
                      imageUrl: data[index]["banner_image"],
                      height: 100,
                      width: 200),
                  CustomText(text: data[index]["banner_name"])
                ],
              );
            },
          );
        },
      ),
    );
  }
}
