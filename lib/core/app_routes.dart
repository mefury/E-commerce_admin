import 'package:get/get.dart';
import 'package:task_manager/view/screens/admin/admin_home/admin_home.dart';
import 'package:task_manager/view/screens/admin/auth/admin_signin.dart';
import 'package:task_manager/view/screens/admin/auth/admin_signup.dart';
import 'package:task_manager/view/screens/admin/banner.dart';
import 'package:task_manager/view/screens/admin/category.dart';
import 'package:task_manager/view/screens/admin/dashboard.dart';
import 'package:task_manager/view/screens/admin/products.dart';
import 'package:task_manager/view/screens/admin/profile.dart';
import 'package:task_manager/view/screens/admin/userlist.dart';
import 'package:task_manager/view/screens/auth/otp_verify.dart';
import 'package:task_manager/view/screens/auth/sign_in.dart';
import 'package:task_manager/view/screens/auth/sign_up.dart';
import 'package:task_manager/view/screens/home_screen/home_screen.dart';
import 'package:task_manager/view/screens/splash_screen/splash_screen.dart';

class AppRoute {
  //======================== Init ======================

  static const String splashScreen = "/splash_screen";

  //======================== Auth ======================
  static const String signIn = "/signIn";
  static const String signUp = "/signUp";
  static const String varifyOTP = "/varifyOTP";

  static const String homeScreen = "/home_screen";

  //====================================== Dashboard Routes ======================================
  static const String adminSignUp = "/adminSignUp";
  static const String adminSignIn = "/adminSignIn";
  static const String adminHome = "/adminHome";

  static const String dashboard = "/dashboard";
  static const String banner = "/banner";
  static const String category = "/category";
  static const String product = "/product";
  static const String userlist = "/userlist";
  static const String profile = "/profile";

  static List<GetPage> routes = [
    //======================== Init ======================

    GetPage(name: splashScreen, page: () => const SplashScreen()),

    //======================== Auth ======================
    GetPage(name: signIn, page: () => SignInScreen()),
    GetPage(name: signUp, page: () => SignUpScreen()),
    GetPage(name: varifyOTP, page: () => const OtpVerify()),
    GetPage(name: homeScreen, page: () => HomeScreen()),

    //====================================== Dashboard Routes ======================================

    GetPage(name: adminSignUp, page: () => AdminSignup()),
    GetPage(name: adminSignIn, page: () => AdminSignin()),
    GetPage(name: adminHome, page: () => AdminHome()),

    GetPage(name: dashboard, page: () => DashboardScreen()),
    GetPage(name: category, page: () => CategoryScreen()),
    GetPage(name: banner, page: () => BannerScreen()),
    GetPage(name: userlist, page: () => UserlistScreen()),
    GetPage(name: profile, page: () => ProfileScreen()),
    GetPage(name: product, page: () => ProductScreen()),
  ];
}
