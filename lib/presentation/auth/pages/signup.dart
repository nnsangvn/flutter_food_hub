import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_hub/common/widget/custom_button.dart';
import 'package:flutter_food_hub/common/widget/custom_input.dart';
import 'package:flutter_food_hub/core/configs/assets/app_images.dart';
import 'package:flutter_food_hub/core/configs/routes/app_router.dart';
import 'package:flutter_food_hub/core/configs/theme/app_colors.dart';
import 'package:flutter_food_hub/core/constants/api_urls.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final dio = Dio();

  void _handleSignUp() async {
    context.push(AppRouter.verify);
    final response = await dio.post(ApiUrls.register, data: {
      'email': _emailController.text,
      'password': _passwordController.text,
      'name': _fullNameController.text,
    });
    print(response.data);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: kWidth,
            child: Padding(
              padding: EdgeInsets.all(kWidth * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Đăng ký",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: kHeight * 0.03),
                  CustomInput(
                    controller: _fullNameController,
                    labelText: "Full name",
                    hintText: "Full name",
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: kHeight * 0.03),
                  CustomInput(
                    controller: _emailController,
                    labelText: "Email",
                    hintText: "Email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: kHeight * 0.03),
                  CustomInput(
                    controller: _passwordController,
                    labelText: "Password",
                    hintText: "Password",
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: AppColors.grey,
                    ),
                  ),
                  SizedBox(height: kHeight * 0.03),
                  CustomButton(
                    title: "ĐĂNG KÝ",
                    width: kWidth * 0.6,
                    height: 60,
                    onPressed: _handleSignUp,
                  ),
                  SizedBox(height: kHeight * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Đã có tài khoản?',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () => context.go(AppRouter.signin),
                        child: Text(
                          'Đăng nhập',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: kHeight * 0.05),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Colors.grey.withValues(alpha: 0.5),
                          endIndent: 10,
                        ),
                      ),
                      Text(
                        "Đăng nhập với",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Colors.grey.withValues(alpha: 0.5),
                          indent: 10,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
