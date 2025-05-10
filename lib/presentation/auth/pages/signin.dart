import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_hub/common/helper/toasts.dart';
import 'package:flutter_food_hub/common/widget/custom_button.dart';
import 'package:flutter_food_hub/common/widget/custom_input.dart';
import 'package:flutter_food_hub/core/configs/assets/app_images.dart';
import 'package:flutter_food_hub/core/configs/routes/app_router.dart';
import 'package:flutter_food_hub/core/configs/theme/app_colors.dart';
import 'package:flutter_food_hub/presentation/auth/bloc/signin_bloc.dart';
import 'package:flutter_food_hub/presentation/auth/bloc/signin_event.dart';
import 'package:flutter_food_hub/presentation/auth/bloc/signin_state.dart';
import 'package:go_router/go_router.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => SigninBloc(),
      child: BlocListener<SigninBloc, SigninState>(
        listener: (context, state) {
          if (state is SigninSuccess) {
            Toasts().showToast("Đăng nhập thành công", ToastType.success);
            context.go(AppRouter.home);
          }
          if (state is SigninFailure) {
            Toasts().showToast(state.message, ToastType.failed);
          }
        },
        child: Scaffold(
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
                        "Đăng nhập",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                        ),
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
                      BlocBuilder<SigninBloc, SigninState>(
                        builder: (context, state) {
                          bool isLoading = state is SigninLoading;
                          return CustomButton(
                            title: isLoading ? "ĐANG ĐĂNG NHẬP..." : "ĐĂNG NHẬP",
                            width: kWidth * 0.6,
                            height: 60,
                            onPressed: isLoading
                                ? null
                                : () {
                                    context.read<SigninBloc>().add(
                                          SigninSubmitted(
                                            email: _emailController.text.trim(),
                                            password: _passwordController.text.trim(),
                                          ),
                                        );
                                  },
                          );
                        },
                      ),
                      SizedBox(height: kHeight * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Chưa có tài khoản?',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 5),
                          GestureDetector(
                            onTap: () => context.go(AppRouter.signup),
                            child: Text(
                              'Đăng ký',
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
        ),
      ),
    );
  }
}
