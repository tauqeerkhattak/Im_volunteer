import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_am_volunteer/routes/app_routes.dart';

class HomeScreenController extends GetxController{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void onApplyVolunteer(){
    Get.toNamed(AppRoutes.volunteerRegistrationScreen);
  }
}