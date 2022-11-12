import 'package:get/get.dart';
import 'package:i_am_volunteer/routes/app_routes.dart';

class CustomBottomNavBarController extends GetxController{
  RxInt selectedNav = 2.obs;
  void onSelectedTabChanged(int index) {
    if (selectedNav.value != index) {
      selectedNav.value = index;
      if(index==0){
        if(Get.currentRoute!=AppRoutes.calenderScreen){
          Get.offNamedUntil(AppRoutes.calenderScreen,(route) => route.isFirst);
        }
      }else if(index==1){
        if(Get.currentRoute!=AppRoutes.paidVolunteerScreen) {
          Get.offNamedUntil(AppRoutes.paidVolunteerScreen,(route) => route.isFirst);
        }
      }else if(index==2){
        if(Get.currentRoute!=AppRoutes.homeScreen) {
          Get.offAllNamed(AppRoutes.homeScreen);
        }
      }else if(index==3){
        if(Get.currentRoute!=AppRoutes.notificationScreen) {
          Get.offNamedUntil(
              AppRoutes.notificationScreen,(route) => route.isFirst);
        }
      }else if(index==4){
        if(Get.currentRoute!=AppRoutes.accountScreen) {
          Get.offNamedUntil(AppRoutes.accountScreen,(route) => route.isFirst);
        }
      }
    }
  }

}