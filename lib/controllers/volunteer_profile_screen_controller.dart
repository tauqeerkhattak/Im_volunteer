import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VolunteerProfileScreenController extends GetxController{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  void onBack(){
    Get.back();
  }
}