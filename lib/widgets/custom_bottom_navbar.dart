import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_am_volunteer/controllers/custom_bottom_navbar_controller.dart';
import 'package:i_am_volunteer/utils/app_colors.dart';

import '../routes/app_routes.dart';

class CustomBottomNavBar extends GetView<CustomBottomNavBarController> {
  CustomBottomNavBar({super.key});
  @override
  final String tag = AppRoutes.kBottomNavigationController;
  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavyBar(
          selectedIndex: controller.selectedNav.value,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.ease,
          onItemSelected: (index) {
            controller.onSelectedTabChanged(index);
          },
          items: <BottomNavyBarItem>[
            navyBar(icons: Icons.calendar_month, text: 'Calender'),
            navyBar(icons: Icons.group, text: 'Paid \nVolunteer'),
            navyBar(icons: Icons.home, text: 'Home'),
            navyBar(icons: Icons.notifications, text: 'Notification'),
            navyBar(icons: Icons.person, text: 'Account'),
          ],
        ));
  }

  BottomNavyBarItem navyBar({required IconData icons, required String text}) {
    return BottomNavyBarItem(
      icon: Icon(
        icons,
        size: 30,
      ),
      title: Text(
        text,
        maxLines: 2,
      ),
      activeColor: AppColors.primary,
      inactiveColor: AppColors.heading.withOpacity(0.2),
      textAlign: TextAlign.center,
    );
  }
}
