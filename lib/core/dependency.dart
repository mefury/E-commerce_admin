import 'package:get/get.dart';
import 'package:task_manager/view/screens/admin/admin_controller/admin_controller.dart';
import 'package:task_manager/view/screens/admin/auth/controller/admin_auth_controller.dart';
import 'package:task_manager/view/screens/auth/controller/auth_controller.dart';
import 'package:task_manager/view/screens/home_screen/controller/home_controller.dart';

class DependancyInjection extends Bindings {
  @override
  void dependencies() {
    //================= Auth ==================
    Get.lazyPut(() => AuthenticationController());

    //================= Home Controller ==================

    Get.lazyPut(() => HomeController());

    /// ===================================== Admin Section ==================================
    Get.lazyPut(() => AdminAuthController());
    Get.lazyPut(() => AdminHomeController());
  }
}
