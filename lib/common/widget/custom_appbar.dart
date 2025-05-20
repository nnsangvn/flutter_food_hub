import 'package:flutter/material.dart';
import 'package:flutter_food_hub/core/configs/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ActionType {
  none,
  avatar,
  favorite,
  svg,
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? customTitle;
  final IconData? backIcon;
  final bool isMenu;
  final VoidCallback? onBackPressed;
  final VoidCallback? onMenuPressed;
  final ActionType actionType;
  final VoidCallback? onActionPressed;
  final String? svgPath;

  const CustomAppBar({
    super.key,
    this.title,
    this.customTitle,
    this.backIcon = Icons.arrow_back_ios_new_rounded,
    this.isMenu = false,
    this.onBackPressed,
    this.onMenuPressed,
    this.actionType = ActionType.none,
    this.onActionPressed,
    this.svgPath,
  });
  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // left
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: isMenu
                    ? (onMenuPressed ?? () {})
                    : (onBackPressed ??
                        () {
                          Navigator.pop(context);
                        }),
                icon: Icon(
                  isMenu ? Icons.menu : backIcon,
                  color: Colors.black,
                  size: 14,
                ),
              ),
            ),

            // title
            if (customTitle != null)
              customTitle!
            else
              Text(
                title ?? '',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),

            // right action
            _buildActionWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildActionWidget() {
    switch (actionType) {
      case ActionType.avatar:
        return GestureDetector(
          onTap: onActionPressed,
          child: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/avatar.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      case ActionType.favorite:
        return GestureDetector(
          onTap: onActionPressed,
          child: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              Icons.favorite,
              color: Colors.white,
              size: 20,
            ),
          ),
        );
      case ActionType.svg:
        return GestureDetector(
          onTap: onActionPressed,
          child: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: svgPath != null
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      svgPath!,
                      fit: BoxFit.contain,
                    ),
                  )
                : SizedBox(),
          ),
        );
      case ActionType.none:
        return SizedBox(width: 38, height: 38);
    }
  }
}
