import 'package:get/get.dart';
import 'package:i_am_volunteer/controllers/account_screen_controller.dart';
import 'package:i_am_volunteer/controllers/calender_screen_controller.dart';
import 'package:i_am_volunteer/controllers/chat_screen_controller.dart';
import 'package:i_am_volunteer/controllers/custom_navigation_drawer_controller.dart';
import 'package:i_am_volunteer/controllers/home_controller.dart';
import 'package:i_am_volunteer/controllers/custom_bottom_navbar_controller.dart';
import 'package:i_am_volunteer/controllers/notification_screen_controller.dart';
import 'package:i_am_volunteer/controllers/paid_volunteer_screen_controller.dart';
import 'package:i_am_volunteer/controllers/user_profile_screen_controller.dart';
import 'package:i_am_volunteer/controllers/volunteer_profile_screen_controller.dart';
import 'package:i_am_volunteer/controllers/volunteer_registration_screen_controller.dart';

import '../controllers/auth_controller.dart';
import '../routes/app_routes.dart';

class ScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => CustomBottomNavBarController(),tag: AppRoutes.kBottomNavigationController);
    Get.lazyPut(() => CalenderScreenController());
    Get.lazyPut(() => PaidVolunteerScreenController());
    Get.lazyPut(() => NotificationScreenController());
    Get.lazyPut(() => AccountScreenController());
    Get.lazyPut(() => VolunteerRegistrationScreenController());
    Get.lazyPut(() => CustomNavigationDrawerController());
    Get.lazyPut(() => UserProfileScreenController());
    Get.lazyPut(() => VolunteerProfileScreenController());
    Get.lazyPut(() => ChatScreenController());
  }
}