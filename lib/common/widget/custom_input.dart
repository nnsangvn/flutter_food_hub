import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_food_hub/core/configs/theme/app_colors.dart';

class CustomInput extends StatelessWidget {
  const CustomInput(
      {super.key,
      this.controller,
      this.keyboardType,
      required this.labelText,
      this.hintText,
      this.suffixIcon,
      this.obscureText = false,
      this.textInputAction,
      this.enable,
      this.bgColor,
      this.inputFormatters});

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final bool? enable;
  final Color? bgColor;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            color: AppColors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: kHeight * 0.01),
        TextFormField(
          enabled: enable,
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.text,
          textInputAction: textInputAction ?? TextInputAction.next,
          obscureText: obscureText,
          cursorColor: AppColors.primary,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            hintText: hintText,
            filled: true,
            fillColor: bgColor ?? Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColors.grey,
                width: 0.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColors.primary,
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.red,
                width: 0.5,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
            suffixIcon: suffixIcon,
          ),
        ).animate(delay: 100.ms).fadeIn().slide(duration: 200.ms),
      ],
    );
  }
}
