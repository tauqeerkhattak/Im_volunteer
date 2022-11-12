import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';
import 'custom_bottom_navbar_controller.dart';

class PaidVolunteerScreenController extends GetxController{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  CustomBottomNavBarController bottomNavigationController = Get.find(tag: AppRoutes.kBottomNavigationController);
  Future<bool> onWillPop() {
    bottomNavigationController.selectedNav.value = 2;
    Get.back();
    return Future.value(false);
  }
}