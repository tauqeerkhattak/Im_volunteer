import 'package:flutter/material.dart';
import 'package:i_am_volunteer/utils/app_colors.dart';

import '../utils/app_assets.dart';
import 'custom_text.dart';

class CornerButton extends StatelessWidget {
  final String label;
  final Function() onTap;

  const CornerButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170,
        height: 60,
        alignment: Alignment.bottomRight,
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(70)),
        ),
        padding: const EdgeInsets.only(
          left: 25,
        ),
        child: Center(
          child: CustomText(
            text: label,
            fontSize: 24,
            enableUnderline: true,
            weight: FontWeight.w400,
            color: AppColors.heading
          ),
        ),
      ),
    );
  }
}
