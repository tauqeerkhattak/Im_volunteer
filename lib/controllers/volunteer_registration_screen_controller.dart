import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VolunteerRegistrationScreenController extends GetxController{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();

  void onBack(){
    Get.back();
  }
}