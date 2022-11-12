import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:i_am_volunteer/routes/app_routes.dart';
import 'package:i_am_volunteer/utils/app_assets.dart';
import 'package:i_am_volunteer/utils/app_colors.dart';
import 'package:i_am_volunteer/widgets/custom_text.dart';
import 'package:i_am_volunteer/widgets/input_field.dart';
import 'package:i_am_volunteer/widgets/styled_button.dart';

import '../../controllers/auth_controller.dart';
import '../../painters/login_painter.dart';
import '../../utils/ui_utils.dart';

class Login extends StatelessWidget {
  final controller = Get.find<AuthController>();
  Login({super.key});

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
                      text: 'Log-In',
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
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputField(
            paddingVertical: 10,
            controller: controller.nameController,
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
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                StyledButton(
                  onTap: () async {
                    UserCredential? userCredential;
                    var errorMessage;
                    try {
                      await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                          email: controller.emailController.text.trim(), password: controller.passwordController.text.trim())
                          .then((value) async {
                        Get.offAllNamed(AppRoutes.homeScreen);
                      });
                      // await auth
                      //     .signInWithEmailAndPassword(email: email, password: password)
                      //     .then((value) {
                      //   userCredential = value;
                      // }).catchError(
                      //   (onError) {
                      //     print('Error: $onError');
                      //   },
                      // );

                      //  final user=   FirebaseFirestore.instance
                      //         .collection('User')
                      //         .where('email', isEqualTo: userCredential.user!.email)
                      //         .get();


                    } on FirebaseAuthException catch (e) {
                      switch (e.code) {
                        case "invalid-email":
                          errorMessage = "Your email address appears to be malformed.";
                          break;
                        case "wrong-password":
                          errorMessage = "Your password is wrong.";
                          break;
                        case "user-not-found":
                          errorMessage = "User with this email doesn't exist.";
                          break;
                        case "user-disabled":
                          errorMessage = "User with this email has been disabled.";
                          break;
                        case "too-many-requests":
                          errorMessage = "Too many requests";
                          break;
                        case "operation-not-allowed":
                          errorMessage = "Signing in with Email and Password is not enabled.";
                          break;
                        default:
                          errorMessage = "An undefined Error happened.";
                      }
                      Fluttertoast.showToast(msg: errorMessage!);
                      print(e.code);
                    }
                  },
                  label: 'Sign In',
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
         const  SizedBox(height: 15,),
          customTextWidget()
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
          Text('Not a member? ', style: TextStyle(color: AppColors.heading,fontWeight: FontWeight.w600,fontSize: 15),),
          GestureDetector(
              onTap: (){
                Get.offNamed(AppRoutes.register);
              },
              child:Text('Register Now',style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w600,fontSize: 15),)),
        ],
      ),
    );
  }

}
