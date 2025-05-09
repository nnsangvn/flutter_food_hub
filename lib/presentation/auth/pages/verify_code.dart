import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_hub/common/helper/toasts.dart';
import 'package:flutter_food_hub/core/configs/routes/app_router.dart';
import 'package:flutter_food_hub/core/configs/theme/app_colors.dart';
import 'package:flutter_food_hub/presentation/auth/bloc/verify_code_bloc.dart';
import 'package:flutter_food_hub/presentation/auth/bloc/verify_code_event.dart';
import 'package:flutter_food_hub/presentation/auth/bloc/verify_code_state.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class VerifyCodePage extends StatelessWidget {
  final String email;
  const VerifyCodePage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => VerifyCodeBloc(),
      child: BlocListener<VerifyCodeBloc, VerifyCodeState>(
        listener: (context, state) {
          if (state is VerifyCodeSuccess) {
            Toasts().showToast("Xác thực thành công", ToastType.success);
            context.go(AppRouter.home);
          }
          if (state is VerifyCodeError) {
            Toasts().showToast(state.message, ToastType.failed);
          }
          if (state is ResendCodeSuccess) {
            Toasts().showToast("Đã gửi lại mã xác nhận", ToastType.success);
          }
          if (state is ResendCodeError) {
            Toasts().showToast(state.message, ToastType.failed);
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(kWidth * 0.06),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Xác thực tài khoản",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: kHeight * 0.03),
                  Text(
                    'Vui lòng nhập mã xác nhận đã được gửi tới địa chỉ $email',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: kHeight * 0.03),
                  BlocBuilder<VerifyCodeBloc, VerifyCodeState>(
                    builder: (context, state) {
                      return PinInputTextField(
                        autoFocus: true,
                        keyboardType: TextInputType.numberWithOptions(decimal: false),
                        decoration: BoxLooseDecoration(
                          textStyle: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          ),
                          strokeColorBuilder:
                              PinListenColorBuilder(AppColors.primary, AppColors.grey),
                        ),
                        cursor: Cursor(
                          color: AppColors.primary,
                          enabled: true,
                          width: 2,
                        ),
                        onChanged: (value) {
                          if (value.length == 6) {
                            context.read<VerifyCodeBloc>().add(
                                  VerifyCode(
                                    email: email,
                                    code: value,
                                  ),
                                );
                          }
                        },
                        enabled: state is! VerifyCodeLoading,
                      );
                    },
                  ),
                  SizedBox(height: kHeight * 0.02),
                  Row(
                    children: [
                      Text(
                        'Không nhận được mã xác nhận!',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 5),
                      BlocBuilder<VerifyCodeBloc, VerifyCodeState>(
                        builder: (context, state) {
                          bool isLoading = state is ResendCodeLoading;
                          return GestureDetector(
                            onTap: isLoading
                                ? null
                                : () {
                                    context.read<VerifyCodeBloc>().add(
                                          ResendCode(email: email),
                                        );
                                  },
                            child: Text(
                              isLoading ? 'Đang gửi...' : 'Gửi lại',
                              style: TextStyle(
                                color: isLoading ? AppColors.grey : AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                              ),
                            ),
                          );
                        },
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
