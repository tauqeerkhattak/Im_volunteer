import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_colors.dart';

class UiUtils {
  static const vertSpace5 = SizedBox(
    height: 5,
  );
  static const vertSpace10 = SizedBox(
    height: 10,
  );
  static const vertSpace20 = SizedBox(
    height: 20,
  );
  static const vertSpace30 = SizedBox(
    height: 30,
  );
  static const vertSpace40 = SizedBox(
    height: 40,
  );
  static const hrtSpace10 = SizedBox(
    width: 10,
  );
  static const hrtSpace20 = SizedBox(
    width: 20,
  );
  static const hrtSpace30 = SizedBox(
    width: 30,
  );
  static const hrtSpace40 = SizedBox(
    width: 40,
  );

  static void showPendingToast(String text) {
    Fluttertoast.showToast(
      msg: text,
      backgroundColor: Colors.red,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  static final loader = Center(
    child: CircularProgressIndicator.adaptive(
      valueColor: AlwaysStoppedAnimation(
        AppColors.primary,
      ),
    ),
  );
}
