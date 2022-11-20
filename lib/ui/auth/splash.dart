import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/ui_utils.dart';
import '../../widgets/custom_text.dart';

class Splash extends StatelessWidget {
  final controller = Get.find<AuthController>();

  Splash({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.white,
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CustomText(
            //   text: 'VOLUNTEER',
            //   fontSize: 40,
            //   spacing: 10,
            //   enableShadow: true,
            //   weight: FontWeight.w700,
            //   color: AppColors.heading,
            // ),
            Image.asset(
              AppAssets.logo,
            ),
            UiUtils.vertSpace20,
            // Image.asset(
            //   AppAssets.splashScreenImage,
            // ),
          ],
        ),
      ),
    );
  }
}
