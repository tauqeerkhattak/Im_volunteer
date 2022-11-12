import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_am_volunteer/utils/app_assets.dart';
import 'package:i_am_volunteer/utils/app_colors.dart';
import 'package:i_am_volunteer/widgets/custom_text.dart';

import '../../controllers/account_screen_controller.dart';
import '../../widgets/custom_scaffold.dart';

class AccountScreen extends StatelessWidget {
  final controller = Get.find<AccountScreenController>();
  AccountScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: _getBody(),
      onWillPop: controller.onWillPop,
      scaffoldKey: controller.scaffoldKey,
      screenName: 'Account Screen',
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
                text: 'Account',
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
          child: Container(
            width: Get.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.primary.withOpacity(0.2), blurRadius: 8)
                ]),
            padding: const EdgeInsets.only(top: 44, left: 20, right: 20),
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
                optionContainer('Volunteer Profile'),
                const SizedBox(
                  height: 30,
                ),
                optionContainer('User Profile'),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
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
      onTap: () {
        controller.onAccountTypeTap(text);
      },
    );
  }
}
