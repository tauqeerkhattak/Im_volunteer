import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import 'custom_bottom_navbar.dart';
import 'custom_navigation_drawer.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? bottomSheet;
  final String screenName;
  final Function? onWillPop,
      gestureDetectorOnTap,
      gestureDetectorOnPanDown,
      onDrawerBtnPressed,
      onNotificationListener;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomScaffold({
    super.key,
    required this.body,
    this.floatingActionButton,
    this.bottomSheet,
    required this.scaffoldKey,
    required this.screenName,
    this.onWillPop,
    this.gestureDetectorOnPanDown,
    this.gestureDetectorOnTap,
    this.onDrawerBtnPressed,
    this.onNotificationListener,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (scaffoldKey.currentState!.isEndDrawerOpen) {
          Get.back();
        } else if (onWillPop != null) {
          onWillPop!();
        }
        return Future.value(false);
      },
      child: GestureDetector(
        onTap: () {
          if (gestureDetectorOnTap != null) {
            gestureDetectorOnTap!();
          }
        },
        onPanDown: (panDetails) {
          if (gestureDetectorOnPanDown != null) {
            gestureDetectorOnPanDown!(panDetails);
          }
        },
        child: NotificationListener(
          onNotification: (notificationInfo) {
            if (onNotificationListener != null) {
              return onNotificationListener!(notificationInfo);
            } else {
              if (notificationInfo is UserScrollNotification) {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              }
              return true;
            }
          },
          child: Scaffold(
            bottomSheet: bottomSheet,
            backgroundColor: Colors.white,
            key: scaffoldKey,
            floatingActionButton: floatingActionButton,
            extendBody: true,
            appBar: screenName == 'Volunteer Registration Screen'
                ? null
                : screenName == 'Chat Screen'
                    ? PreferredSize(
                        preferredSize: const Size.fromHeight(100),
                        child: Container(
                          color: AppColors.secondary,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                  top: 50,
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        const CircleAvatar(
                                          radius: 20,
                                          backgroundImage: AssetImage(
                                            AppAssets.personImage2,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Admin@gmail.com',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.primary,
                                              ),
                                            ),
                                            const Text(
                                              'Online/Offline',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : AppBar(
                        backgroundColor: AppColors.primary.withOpacity(0.07),
                        bottomOpacity: 0.0,
                        elevation: 0.0,
                        // title: Center(
                        //   child: Image.asset(
                        //     AppAssets.logo,
                        //     height: 60,
                        //   ),
                        // ),
                        leading: GestureDetector(
                          onTap: () {
                            scaffoldKey.currentState!.openDrawer();
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          child: Icon(
                            Icons.menu,
                            color: AppColors.primary,
                            size: 30,
                          ),
                        ),
                      ),
            body: body,
            bottomNavigationBar:
                screenName == 'Volunteer Registration Screen' ||
                        screenName == 'Chat Screen'
                    ? null
                    : CustomBottomNavBar(),
            drawer: screenName == 'Volunteer Registration Screen'
                ? null
                : CustomNavigationDrawer(),
          ),
        ),
      ),
    );
  }
}
