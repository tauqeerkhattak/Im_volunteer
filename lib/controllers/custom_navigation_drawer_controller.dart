import 'dart:developer';

import 'package:get/get.dart';
import 'package:i_am_volunteer/routes/app_routes.dart';

import '../services/auth_service.dart';
import '../services/locator.dart';
import '../services/messaging_service.dart';

class CustomNavigationDrawerController extends GetxController {
  final messaging = locator.get<MessagingService>();
  final authService = locator.get<AuthService>();

  void onDrawerItemTap({required String screenName}) async {
    if (screenName == 'Chat Box') {
      Get.toNamed(AppRoutes.chatScreen);
    } else if (screenName == 'Log Out') {
      await logout();
    }
  }

  Future<void> logout() async {
    final isLoggedOut = await authService.logout();
    if (isLoggedOut) {
      log('LoggedOut!');
      await messaging.deleteToken();
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
