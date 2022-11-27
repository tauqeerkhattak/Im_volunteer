import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_am_volunteer/utils/app_assets.dart';
import 'package:i_am_volunteer/utils/app_colors.dart';
import 'package:i_am_volunteer/widgets/custom_text.dart';
import '../../controllers/notification_screen_controller.dart';
import '../../widgets/custom_scaffold.dart';

class NotificationScreen extends StatelessWidget{
  final controller = Get.find<NotificationScreenController>();
  NotificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: _getBody(),
      onWillPop: controller.onWillPop,
      scaffoldKey: controller.scaffoldKey,
      screenName: 'Notification Screen',);
  }
  Widget _getBody(){
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            notificationSearchWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomText(text: 'New',fontSize: 20,color: AppColors.heading,weight: FontWeight.w700,),
            ),
            notificationContainer(image: AppAssets.personImage2, notificationDescription: 'Dr ABC added a event'),
            notificationContainer(image: AppAssets.personImage1, notificationDescription: 'Dr ABCDE added a event'),
            notificationContainer(image: AppAssets.personImage3, notificationDescription: 'Dr IJKL added a event'),
          ],
        ),
      ),
    );
  }

  Widget notificationContainer({required String image, required String notificationDescription}){
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.secondary,width: 2))
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(image),
          ),
          const SizedBox(width:10),
          Expanded(child: CustomText(text: notificationDescription,weight: FontWeight.w500,)),
          Icon(Icons.more_horiz,color: AppColors.primary,)
        ],
      ),

    );
  }

  Widget notificationSearchWidget(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: 'Notification',fontSize: 30,color: AppColors.primary,weight: FontWeight.w700,),
          const Icon(Icons.search,),
        ],
      ),
    );
  }
}