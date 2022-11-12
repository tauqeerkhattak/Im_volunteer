import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:i_am_volunteer/controllers/auth_controller.dart';
import 'package:i_am_volunteer/routes/app_routes.dart';
import 'package:i_am_volunteer/utils/app_colors.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


import '../../painters/login_painter.dart';
import '../../utils/app_assets.dart';
import '../../utils/ui_utils.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/input_field.dart';
import '../../widgets/styled_button.dart';

class Register extends StatelessWidget {
  final controller = Get.find<AuthController>();

  Register({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            _topIllustration(),
            Expanded(
              child: _body(),
            ),
            /*Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CornerButton(
                  label: 'Sign In',
                  onTap: () {
                    Get.offNamed(
                      AppRoutes.login,
                    );
                  },
                ),
              ],
            ),*/
          ],
        ),
      ),
    );
  }

  Widget _topIllustration() {
    return CustomPaint(
      painter: RegisterPainter(),
      child: SizedBox(
        // color: Colors.pink,
        height: Get.height * 0.3,
        child: Column(
          children: [
            UiUtils.vertSpace20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               Expanded(
                  child: Center(
                    child: CustomText(
                      text: 'Create\nAccount',
                      color: AppColors.primary,
                      weight: FontWeight.w700,
                      fontSize: 36,
                      enableShadow: true,
                    ),
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    AppAssets.manCreativity,
                    height: 120,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    bool _passwordVisible= false;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputField(
            paddingVertical: 10,
            controller: controller.nameController,
            hint: 'NAME',
            suffixIcon: Icons.person,
          ),
          InputField(
            paddingVertical: 10,
            controller: controller.emailController,
            hint: 'EMAIL',
            suffixIcon: Icons.mail_outline,
          ),
          InputField(
            paddingVertical: 10,
            controller: controller.passwordController,
            hint: 'PASSWORD',
            suffixIcon: Icons.remove_red_eye_outlined,
          ),
          // iAmNotRobotContainer(),
          UiUtils.vertSpace20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                StyledButton(
                  onTap: () async {
                    UserCredential userCredential;
                    try {
                      userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: controller.emailController.text, password: controller.passwordController.text);
                      DocumentReference ref =
                      FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid);
                      String? token = await FirebaseMessaging.instance.getToken(
                        vapidKey:
                        'BObhGi6Xf3yREvhNqEjA64zuHuDryeX3Do8i32FLY-Yp4n87cDDFsTPjMNyQCI2nlD2_xJzWdsE-5R2XP2JLaCk',
                      );
                      await ref.set({
                        'docId': ref.id,
                        'token': token,
                        'email': controller.emailController.text.trim(),
                        'role': "user",
                        'name': controller.nameController.text.trim(),
                        'password': controller.nameController.text.trim(),
                      }).whenComplete(() {
                        flutterToast(
                            msg:
                            'Account is pending verification\n Please wait till the verification complete.',
                            bgColor: Colors.red,
                            toastLength: Toast.LENGTH_SHORT);
                        Get.toNamed(
                          AppRoutes.homeScreen,
                        );
                      });
                    } on FirebaseAuthException catch (err) {
                      print(err.message);
                    }
                    log('Sign Up');
                  },
                  label: 'Sign Up',
                ),
              ],
            ),
          ),
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: AppColors.heading.withOpacity(0.1),
                      ),
                    ),
                    CustomText(
                      text: '  Or sign in with   ',
                      color: AppColors.heading.withOpacity(0.5),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color:AppColors.heading.withOpacity(0.1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                      color: AppColors.heading.withOpacity(0.1),
                    )]
                  ),
                  child: Center(child: Image.asset(AppAssets.googleIcon,height: 30,),),
                )
              ],
            ),
          ),
          customTextWidget(),
        ],
      ),
    );
  }

  Widget iAmNotRobotContainer(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
      child: Container(
        width: Get.width/2,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.07),
              blurRadius: 7
            )
          ]
        
        ),
        child: Row(
          children: [
            Icon(Icons.check,color: AppColors.primary,),
            const SizedBox(width: 3,),
            Expanded(child: CustomText(text: 'I\'m not a robot',color: AppColors.heading,)),
            Image.asset(AppAssets.captcha,height: 30,)
            
          ],
        ),
      ),
    );
  }

  Widget customTextWidget(){
    return Padding(
      padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Already a member? ', style: TextStyle(color: AppColors.heading,fontWeight: FontWeight.w600,fontSize: 15),),
          GestureDetector(
              onTap: (){
                Get.offNamed(AppRoutes.login);
              },
              child:Text('Sign in',style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w600,fontSize: 15),)),
        ],
      ),
    );
  }
}

flutterToast(
    {required String msg, required Color bgColor, required Toast toastLength}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: bgColor,
      textColor: Colors.white,
      fontSize: 16.0);
}
