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
  final bool showBottomNavigation;
  final bool showAppBar;
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
    this.showBottomNavigation = true,
    this.showAppBar = true,
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
                : showAppBar
                    ? AppBar(
                        backgroundColor: AppColors.primary.withOpacity(0.07),
                        bottomOpacity: 0.0,
                        elevation: 0.0,

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
                      )
                    : null,
            body: body,
            bottomNavigationBar:
                screenName == 'Volunteer Registration Screen' ||
                        screenName == 'Chat Screen'
                    ? null
                    : showBottomNavigation
                        ? CustomBottomNavBar()
                        : null,
            drawer: screenName == 'Volunteer Registration Screen'
                ? null
                : CustomNavigationDrawer(),
          ),
        ),
      ),
    );
  }
}

