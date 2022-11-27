import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_am_volunteer/controllers/custom_bottom_navbar_controller.dart';
import 'package:i_am_volunteer/routes/app_routes.dart';

class AccountScreenController extends GetxController{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  CustomBottomNavBarController bottomNavigationController = Get.find(tag: AppRoutes.kBottomNavigationController);
  void onAccountTypeTap(String text){
    if(text.toLowerCase().contains('user')){
      Get.toNamed(AppRoutes.userProfileScreen);
    }else{
      Get.toNamed(AppRoutes.volunteerProfileScreen);
    }
  }

  Future<bool> onWillPop() {
    bottomNavigationController.selectedNav.value = 2;
    Get.back();

    return Future.value(false);
  }
}