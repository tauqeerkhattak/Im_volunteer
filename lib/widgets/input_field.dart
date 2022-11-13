import 'package:flutter/material.dart';
import 'package:i_am_volunteer/utils/app_colors.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final double? paddingVertical;
  final double? paddingHorizontal;
  final String? Function(String?)? validator;
  final bool hideText;

  const InputField({
    super.key,
    required this.controller,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.paddingVertical = 30,
    this.paddingHorizontal = 20,
    this.validator,
    this.hideText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: paddingVertical!,
        horizontal: paddingHorizontal!,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: AppColors.primary.withOpacity(0.1), blurRadius: 2),
          ],
        ),
        child: TextFormField(
          controller: controller,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: hideText,
          decoration: InputDecoration(
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? Icon(
                    suffixIcon,
                  )
                : null,
            contentPadding:
                const EdgeInsets.only(top: 15, bottom: 15, left: 10),
            hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.3),
            ),
            hintText: hint,
            border: _normalBorder(),
            focusedBorder: _normalBorder(),
            disabledBorder: _normalBorder(),
            enabledBorder: _normalBorder(),
            errorBorder: _errorBorder(),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _normalBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black.withOpacity(0.05),
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }

  OutlineInputBorder _errorBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
