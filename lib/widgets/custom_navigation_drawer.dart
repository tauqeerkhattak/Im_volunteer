import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_am_volunteer/controllers/custom_navigation_drawer_controller.dart';
import 'package:i_am_volunteer/utils/app_assets.dart';
import 'package:i_am_volunteer/utils/app_colors.dart';
import 'package:i_am_volunteer/widgets/custom_text.dart';

class CustomNavigationDrawer extends StatelessWidget {
  final controller = Get.find<CustomNavigationDrawerController>();
  CustomNavigationDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 1.5,
      child: Drawer(
        child: Column(
          children: [
            Container(
              color: AppColors.primary.withOpacity(0.07),
              height: 180,
              child: SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                          AppAssets.personImage2,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        textAlign: TextAlign.center,
                        text: 'Name xyz',
                        color: AppColors.primary,
                        weight: FontWeight.w700,
                      ),
                      const Expanded(
                        child: CustomText(
                          textAlign: TextAlign.center,
                          text: 'Email@gmail.com',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            drawerWidget(
              Icons.person,
              'Admin Login/Profile',
            ),
            drawerWidget(
              Icons.event,
              'Add Event',
            ),
            drawerWidget(
              Icons.mail_outline,
              'Chat Box',
            ),
            drawerWidget(
              Icons.group,
              'Manage Volunteer',
            ),
            drawerWidget(
              Icons.logout,
              'Log Out',
            )
          ],
        ),
      ),
    );
  }

  Widget drawerWidget(IconData icon, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: GestureDetector(
        onTap: () {
          controller.onDrawerItemTap(screenName: name);
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: AppColors.primary),
                const SizedBox(
                  width: 3,
                ),
                CustomText(text: name),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Divider(
              color: AppColors.primary.withOpacity(0.07),
              thickness: 2,
            )
          ],
        ),
      ),
    );
  }
}
