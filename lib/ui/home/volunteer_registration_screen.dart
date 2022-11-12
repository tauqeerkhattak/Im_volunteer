import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_am_volunteer/utils/app_assets.dart';
import 'package:i_am_volunteer/utils/app_colors.dart';
import 'package:i_am_volunteer/widgets/custom_scaffold.dart';
import 'package:i_am_volunteer/widgets/custom_text.dart';
import '../../controllers/volunteer_registration_screen_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/input_field.dart';

class VolunteerRegistrationScreen extends StatelessWidget{
  final controller = Get.find<VolunteerRegistrationScreenController>();
  VolunteerRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      onWillPop: controller.onBack,
        body: _getBody(),
        scaffoldKey: controller.scaffoldKey,
        screenName: 'Volunteer Registration Screen');
  }
Widget _getBody(){
    return Stack(
      children: [
      Container(
        width: Get.width,
        color: AppColors.primary.withOpacity(0.07)
      ),
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(200))
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Transform.rotate(
            angle: pi,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(200))
              ),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.2),
                    blurRadius: 8
                  )
                ]
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Center(
                      child:  Padding(
                        padding: const EdgeInsets.only(top: 13,bottom: 25),
                        child: CustomText(
                          textAlign: TextAlign.center,
                          text: 'VOLUNTEER REGISTRATION',
                          fontSize: 20,
                          spacing: 4,
                          enableShadow: true,
                          weight: FontWeight.w700,
                          color: AppColors.heading,
                        ),
                      ),
                    ),
                    InputField(
                      paddingVertical: 7,
                      controller: controller.nameController,
                      hint: 'NAME',
                      suffixIcon: Icons.person,
                    ),
                    InputField(
                      paddingVertical: 7,
                      controller: controller.emailController,
                      hint: 'EMAIL',
                      suffixIcon: Icons.person,
                    ),
                    InputField(
                      paddingVertical: 7,
                      controller: controller.passwordController,
                      hint: 'PASSWORD',
                      suffixIcon: Icons.remove_red_eye_outlined,
                    ),
                    InputField(
                      paddingVertical: 7,
                      controller: controller.phoneNumberController,
                      hint: 'PHONE NO:',
                      suffixIcon: Icons.phone_enabled,
                    ),
                    InputField(
                      paddingVertical: 7,
                      controller: controller.countryCodeController,
                      hint: 'DEPARTMENT',
                      suffixIcon: Icons.arrow_drop_down_outlined,
                    ),
                    imageUploadWidget('ID Card Image'),
                    imageUploadWidget('File Image'),
                    const SizedBox(height: 40,),
                    CustomButton(
                      color: AppColors.primary,
                      label: 'Submit',
                      textColor: AppColors.white,
                      height: 45,
                      onTap: () {  },),
                    const SizedBox(height: 10,)
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
}

Widget imageUploadWidget(String text){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.imageGallery,height: 35),
          const SizedBox(width: 6,),
          CustomText(text: text,color: AppColors.primary,weight: FontWeight.w500,)
        ],
      ),
    );
}
}