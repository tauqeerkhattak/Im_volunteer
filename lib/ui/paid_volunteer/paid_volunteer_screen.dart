import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/paid_volunteer_screen_controller.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/custom_text.dart';

class PaidVolunteerScreen extends StatelessWidget{
  final controller = Get.find<PaidVolunteerScreenController>();
  PaidVolunteerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: _getBody(),
      onWillPop: controller.onWillPop,
      scaffoldKey: controller.scaffoldKey,
      screenName: 'Paid Volunteer Screen',);
  }
  Widget _getBody(){
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 60),
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
            informationCard(profileImage: AppAssets.personImage2, name: 'Dr.cde', profession: 'Musician', experience: '3 Years', contactNum: '+92 1234567890',price: '2000'),
            informationCard(profileImage: AppAssets.personImage3, name: 'Dr.abd', profession: 'Software Engineer', experience: '4 Years', contactNum: '+92 1234566590',price: '3000'),
            informationCard(profileImage: AppAssets.personImage1, name: 'Dr.akl', profession: 'Singer', experience: '1 Years', contactNum: '+92 321566590',price: '40000'),
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

  Widget informationCard({required String profileImage, required String name,required String profession,required String experience,required String contactNum,required String price}){
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: AppColors.primary.withOpacity(0.07),blurRadius: 3),
            ]
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            profileImageWidget(image: profileImage),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  textAlign: TextAlign.center,
                  text: name,color: AppColors.primary,weight: FontWeight.w700,fontSize: 20),
                const SizedBox(width: 4,),
                Icon(Icons.facebook,size: 20,color: AppColors.heading.withOpacity(0.3),),
                Image.asset(AppAssets.instaIcon,height: 20,color: AppColors.heading.withOpacity(0.3),)
              ],
            ),
            profileInformation(profession: profession, experience: experience, contactNum: contactNum),
            CustomButton(
              fontWeight: FontWeight.w500,
              textSize: 16,
              width: Get.width,
              height: 40,
              label: 'One Event Price is: $price',
              onTap: ()=>null,color: AppColors.primary.withOpacity(0.07),
              textColor: AppColors.heading,
              isShadow: false,),
          ],
        ),


      ),
    );
  }

  Widget profileImageWidget({required String image}){
    return CircleAvatar(
      radius: 35,
      backgroundImage: AssetImage(image),
    );
  }
  Widget profileInformation(
      {required String profession, required String experience, required String contactNum}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(name: 'Profession'),
              const SizedBox(height: 10,),
              customText(name: 'Contact No:'),
              const SizedBox(height: 10,),
              customText(name: 'Experience'),
            ],
          ),
          Container(color: AppColors.primary,width: 3,height: 70),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(value: profession),
              const SizedBox(height: 10,),
              customText(value: contactNum),
              const SizedBox(height: 10,),
              customText(value: experience),
            ],
          ),
        ],
      ),
    );

  }


  Widget customText({String value='', String name=''}){
    return  CustomText(text: value!=''?value:name,color: value!=''?AppColors.primary:AppColors.heading,fontSize: 15,weight: FontWeight.w600,);
  }

}