import 'dart:developer';

import 'package:get/get.dart';
import 'package:i_am_volunteer/routes/app_routes.dart';

import '../services/auth_service.dart';
import '../services/locator.dart';
import '../services/messaging_service.dart';
import 'chat_screen_controller.dart';

class CustomNavigationDrawerController extends GetxController {
  final messaging = locator.get<MessagingService>();
  final authService = locator.get<AuthService>();
  final chatController = Get.find<ChatScreenController>();

  void onDrawerItemTap({required String screenName}) async {
    if (screenName == 'Chat Box') {
      // Get.toNamed(AppRoutes.userList);
      if (authService.user!.isAdmin()) {
        Get.toNamed(AppRoutes.userList);
      } else {
        await chatController.createChatWithAdmin();
        Get.toNamed(AppRoutes.chatScreen);
      }
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

