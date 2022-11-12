import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_am_volunteer/controllers/user_profile_screen_controller.dart';
import 'package:i_am_volunteer/widgets/custom_button.dart';
import 'package:i_am_volunteer/widgets/input_field.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/custom_text.dart';

class UserProfileScreen extends StatelessWidget{
  final controller = Get.find<UserProfileScreenController>();
  UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: _getBody(),
      onWillPop: controller.onBack,
      scaffoldKey: controller.scaffoldKey,
      screenName: 'User Profile Screen',);
  }
  Widget _getBody(){
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 150,
              width: Get.width,
              color: AppColors.primary.withOpacity(0.07),
              padding: const EdgeInsets.only(top: 30,left: 20),
              child: CustomText(text: 'User',fontSize: 30,color: AppColors.primary,weight: FontWeight.w700,),
            )
          ],
        ),
        Positioned(
          left: 20,
          right: 20,
          top: 130,
          bottom:70,
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
              padding: const EdgeInsets.only(top: 44,left: 20,right: 20),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    CustomText(text: 'Name Xyz',color: AppColors.primary,weight: FontWeight.w700,),
                    CustomText(text: 'email123@gmail.com',color: AppColors.heading,weight: FontWeight.w500,),
                    const SizedBox(height: 30,),
                    InputField(
                      paddingHorizontal: 0,
                      paddingVertical: 0,
                      controller: controller.nameController,hint: 'Name',suffixIcon: Icons.edit,),
                    const SizedBox(height: 20,),
                    InputField(
                      paddingHorizontal: 0,
                      paddingVertical: 0,
                      controller: controller.emailController,hint: 'Email',suffixIcon: Icons.edit,),
                    const SizedBox(height: 20,),
                    InputField(
                      paddingHorizontal: 0,
                      paddingVertical: 0,
                      controller: controller.passwordController,hint: 'Password Change',suffixIcon: Icons.edit,),
                    const SizedBox(height: 20,),
                    CustomButton(
                        width: Get.width,
                        height: 48,
                        label: 'Log Out', onTap: (){},color: AppColors.primary,textColor: AppColors.white,isShadow: false,),
                    const SizedBox(height: 20,),
                    CustomButton(height: 48,label: 'Save', onTap: (){},color: AppColors.primary.withOpacity(0.07),textColor: AppColors.primary,isShadow: false,),
                    const SizedBox(height: 20,),
                  ],
                ),
              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 90),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(AppAssets.personImage2),
              ),
            ],
          ),
        ),
      ],
    );
  }

}