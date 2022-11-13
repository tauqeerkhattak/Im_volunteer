import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_am_volunteer/controllers/volunteer_profile_screen_controller.dart';
import 'package:i_am_volunteer/utils/app_assets.dart';
import 'package:i_am_volunteer/utils/app_colors.dart';
import 'package:i_am_volunteer/widgets/custom_button.dart';
import 'package:i_am_volunteer/widgets/custom_scaffold.dart';
import 'package:i_am_volunteer/widgets/custom_text.dart';
import 'package:i_am_volunteer/widgets/input_field.dart';

class VolunteerProfileScreen extends StatelessWidget {
  final controller = Get.find<VolunteerProfileScreenController>();
  VolunteerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: _getBody(),
      onWillPop: controller.onBack,
      scaffoldKey: controller.scaffoldKey,
      screenName: 'Volunteer Profile Screen',
    );
  }

  Widget _getBody() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 150,
              width: Get.width,
              color: AppColors.primary.withOpacity(0.07),
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: CustomText(
                text: 'Volunteer',
                fontSize: 30,
                color: AppColors.primary,
                weight: FontWeight.w700,
              ),
            )
          ],
        ),
        Positioned(
          left: 20,
          right: 20,
          top: 130,
          bottom: 70,
          child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.primary.withOpacity(0.2),
                        blurRadius: 8)
                  ]),
              padding: const EdgeInsets.only(top: 44, left: 20, right: 20),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    CustomText(
                      text: 'Name Xyz',
                      color: AppColors.primary,
                      weight: FontWeight.w700,
                    ),
                    CustomText(
                      text: 'email123@gmail.com',
                      color: AppColors.heading,
                      weight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InputField(
                      paddingHorizontal: 0,
                      paddingVertical: 0,
                      controller: controller.nameController,
                      hint: 'Name',
                      suffixIcon: Icons.edit,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputField(
                      paddingHorizontal: 0,
                      paddingVertical: 0,
                      controller: controller.emailController,
                      hint: 'Email',
                      suffixIcon: Icons.edit,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputField(
                      paddingHorizontal: 0,
                      paddingVertical: 0,
                      controller: controller.phoneNumber,
                      hint: 'Phone Number',
                      suffixIcon: Icons.edit,
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      height: 48,
                      label: 'Save',
                      onTap: () {},
                      color: AppColors.primary.withOpacity(0.07),
                      textColor: AppColors.primary,
                      isShadow: false,
                    ),
                  ],
                ),
              )),
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

  Widget optionContainer(String text) {
    return GestureDetector(
      child: Container(
        height: 55,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: AppColors.primary.withOpacity(0.1), blurRadius: 8)
            ]),
        child: Center(
          child: CustomText(
            text: text,
            color: AppColors.primary,
            fontSize: 20,
            weight: FontWeight.w600,
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
