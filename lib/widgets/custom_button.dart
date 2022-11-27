import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final double? width,height;
  final Color? color;
  final bool? isShadow;
  final Color? textColor;
  final double? textSize;
  final FontWeight? fontWeight;
  final Function() onTap;
  const CustomButton({
    super.key,
    required this.label,
    required this.onTap,
    this.width,
    this.color, this.textColor, this.height, this.isShadow, this.textSize, this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        width: width ?? Get.width * 0.5,
        height: height??60,
        decoration: BoxDecoration(
          color: color ?? AppColors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            isShadow==true?BoxShadow(color: AppColors.heading.withOpacity(0.1),blurRadius:30,spreadRadius: 2):BoxShadow(color: AppColors.white,spreadRadius: 2)
          ]
        ),
        child: Center(
          child: CustomText(
            text: label,
            fontSize: textSize??25,
            weight: fontWeight??FontWeight.w600,
            color: textColor??AppColors.heading,
          ),
        ),
      ),
    );
  }
}
