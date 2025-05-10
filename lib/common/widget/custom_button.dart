import 'package:flutter/material.dart';
import 'package:flutter_food_hub/core/configs/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? icon;
  final bool isOutlined;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.height,
    this.width,
    this.backgroundColor = AppColors.primary,
    this.textColor = Colors.white,
    this.icon,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isOutlined ? Colors.transparent : backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: isOutlined ? BorderSide(color: Colors.white, width: 1.5) : BorderSide.none,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              if (!isOutlined)
                BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    spreadRadius: 0,
                    blurRadius: 20,
                    blurStyle: BlurStyle.outer),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: width == null ? MainAxisSize.min : MainAxisSize.max,
            children: [
              if (icon != null) ...[
                icon!,
                const SizedBox(width: 10),
              ],
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
