import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileScreenController extends GetxController{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void onBack(){
    Get.back();
  }
}