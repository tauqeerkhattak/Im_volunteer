import 'package:get/get.dart';
import 'package:i_am_volunteer/routes/app_routes.dart';

class CustomNavigationDrawerController extends GetxController{

  void onDrawerItemTap({required String screenName}){
    if(screenName=='Chat Box'){
      Get.toNamed(AppRoutes.chatScreen);
    }
  }

}