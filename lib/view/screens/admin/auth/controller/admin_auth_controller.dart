import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:task_manager/core/app_routes.dart';

class AdminAuthController extends GetxController {
  Rx<TextEditingController> emailController =
      TextEditingController(text: kDebugMode ? "mdh95831@gmail.com" : "").obs;
  Rx<TextEditingController> passController =
      TextEditingController(text: kDebugMode ? "1234567Rr" : "").obs;

  RxBool isLoading = false.obs;

  signUpadmin() async {
    isLoading.value = true;
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.value.text,
        password: passController.value.text,
      );

      print("Auth User ===============>>>>>>>>>>>>>>> ${credential.user?.uid}");

      Get.toNamed(AppRoute.adminSignIn);

      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      isLoading.value = false;
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }

  signInAdmin() async {
    isLoading.value = true;

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.value.text,
        password: passController.value.text,
      );

      print("Auth User ===============>>>>>>>>>>>>>>> ${credential.user?.uid}");

      Get.toNamed(AppRoute.adminHome);

      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      isLoading.value = false;
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }
}
