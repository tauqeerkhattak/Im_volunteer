import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_am_volunteer/routes/app_routes.dart';
import 'package:i_am_volunteer/utils/app_colors.dart';
import 'package:i_am_volunteer/utils/ui_utils.dart';
import 'package:i_am_volunteer/widgets/custom_text.dart';

import '../../controllers/auth_controller.dart';
import '../../utils/app_assets.dart';
import '../../widgets/custom_button.dart';

class AuthDashboard extends StatelessWidget {
  final controller = Get.find<AuthController>();
  AuthDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Welcome',
                color: AppColors.primary,
                fontSize: 25,
                weight: FontWeight.w800,
              ),
              const SizedBox(height: 10),
              CustomText(
                text: 'Please Choose Login or Register for continue our app',
                color: AppColors.heading,
                fontSize: 18,
                weight: FontWeight.w500,
              ),
              const SizedBox(
                height: 100,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.logo,
                  ),
                  UiUtils.vertSpace40,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        label: 'Login',
                        width: Get.width * 0.4,
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.login,
                          );
                        },
                        color: AppColors.primary.withOpacity(0.07),
                        textColor: AppColors.primary,
                        isShadow: false,
                      ),
                      UiUtils.hrtSpace20,
                      CustomButton(
                        label: 'Register',
                        width: Get.width * 0.4,
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.register,
                          );
                        },
                        color: AppColors.primary.withOpacity(0.07),
                        textColor: AppColors.primary,
                        isShadow: false,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
