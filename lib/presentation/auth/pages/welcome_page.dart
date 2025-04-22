import 'package:flutter/material.dart';
import 'package:flutter_food_hub/common/widget/custom_button.dart';
import 'package:flutter_food_hub/core/configs/assets/app_images.dart';
import 'package:flutter_food_hub/core/configs/routes/app_router.dart';
import 'package:flutter_food_hub/core/configs/theme/app_colors.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.welcomeBG),
              ),
            ),
          ),
          Container(
            color: Colors.black.withValues(alpha: 0.3),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 100,
              horizontal: 40,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome To",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'FoodHub',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Your favourite foods delivered fast at your door.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF30384F),
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.white.withValues(alpha: 0.5),
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      "Đăng nhập với",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.white.withValues(alpha: 0.5),
                        indent: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        title: 'FACEBOOK',
                        icon: Image.asset(
                          AppImages.facebookLogo,
                          height: 24,
                          width: 24,
                        ),
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        onPressed: () => {},
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CustomButton(
                        title: 'GOOGLE',
                        icon: Image.asset(
                          AppImages.googleLogo,
                          height: 24,
                          width: 24,
                        ),
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        onPressed: () => {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomButton(
                  title: 'Đăng nhập với email',
                  isOutlined: true,
                  textColor: Colors.white,
                  width: double.infinity,
                  onPressed: () => context.push(AppRouter.signin),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Đã có tài khoản?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () => context.push(AppRouter.signin),
                      child: Text(
                        'Đăng nhập',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
