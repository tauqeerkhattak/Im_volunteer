import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_am_volunteer/controllers/home_controller.dart';
import 'package:i_am_volunteer/widgets/custom_text.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_scaffold.dart';

class HomeScreen extends StatelessWidget{
  final controller = Get.find<HomeScreenController>();
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: _getBody(),
      scaffoldKey: controller.scaffoldKey,
      screenName: 'Home Screen',);
  }
Widget _getBody(){
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          children: [
           SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             physics: const BouncingScrollPhysics(),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 statusWidget(image: AppAssets.personImage1, text: 'Dr. ABCD'),
                 statusWidget(image: AppAssets.personImage2, text: 'Dr. CDEF'),
                 statusWidget(image: AppAssets.personImage3, text: 'Dr. IJKL'),
                 statusWidget(image: AppAssets.personImage1, text: 'Dr. ABCDEF'),
                 statusWidget(image: AppAssets.personImage2, text: 'Dr. CDEFGHI'),
                 statusWidget(image: AppAssets.personImage3, text: 'Dr. IJKLMNO'),

               ],
             ),
           ),
            postWidget(image: AppAssets.eventPhoto, name: 'Dr. IJKL', profileImage: AppAssets.personImage3,openEvent: false),
            postWidget(image: AppAssets.eventPhoto2, name: 'Dr. CDEF', profileImage: AppAssets.personImage2,openEvent: true)

          ],
        ),
      ),
    );
}

Widget statusWidget({required String image, required String text}){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor:  AppColors.primary.withOpacity(0.4),
            child: CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage(image),
            ),
          ),
          const SizedBox(height: 7,),
          CustomText(text: text),
        ],
      ),
    );
}

Widget postWidget({required String image, required String name, required String profileImage,required bool openEvent}){
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: AppColors.primary.withOpacity(0.07),blurRadius: 3),
          ]
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                profileImageWidget(image: profileImage),
                const SizedBox(width: 10,),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: name,color: AppColors.primary,weight: FontWeight.w600,),
                    const CustomText(text: 'Added a new event')
                  ],
                )),
                const Icon(Icons.more_vert),
                
              ],
            ),
            const SizedBox(height: 14,),
            postImage(image),
            const SizedBox(height: 7),
            bottomWidgetOfPost(openEvent)
          ],
        ),


      ),
    );
}


Widget profileImageWidget({required String image}){
    return CircleAvatar(
      radius: 22,
      backgroundColor:  AppColors.primary.withOpacity(0.4),
      child: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(image),
      ),
    );
}

Widget postImage(String image){
    return Container(
      height: 200,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(image,fit: BoxFit.cover)),
    );
}

Widget bottomWidgetOfPost(bool isEventOpen){
    return Row(
      children: [
        const Icon(Icons.favorite_border),
        const SizedBox(width: 13),
        const Icon(Icons.chat_bubble_outline),
        const Spacer(),
        isEventOpen?GestureDetector(
          onTap: () {
            controller.onApplyVolunteer();
          },
          child: Container(
            height: 40,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: AppColors.primary.withOpacity(0.4),
                    width: 2
                )
            ),
            child: const CustomText(text: 'Apply For Volunteer',weight: FontWeight.w600,),
          ),
        ):const SizedBox()
      ],
    );
}




}