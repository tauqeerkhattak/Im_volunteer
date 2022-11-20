import 'package:flutter/material.dart';
import 'package:i_am_volunteer/painters/login_painter.dart';
import 'package:i_am_volunteer/utils/app_colors.dart';

import '../utils/app_assets.dart';
import '../utils/ui_utils.dart';
import 'custom_text.dart';

class StyledButton extends StatelessWidget {
  final String label;
  final Function() onTap;

  const StyledButton({
    super.key,
    required this.label,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CustomText(
            text: label,
            family: 'Roboto',
            fontSize: 30,
            weight: FontWeight.w500,
          ),
          UiUtils.hrtSpace20,
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.07),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60),bottomLeft: Radius.circular(60),topRight: Radius.circular(30),bottomRight: Radius.circular(30))
              /*image: DecorationImage(
                image: AssetImage(
                  AppAssets.iconButton,
                ),
              ),*/
            ),
            child: Icon(
              Icons.arrow_forward,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
