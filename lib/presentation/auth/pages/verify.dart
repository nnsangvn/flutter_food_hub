import 'package:flutter/material.dart';
import 'package:flutter_food_hub/core/configs/theme/app_colors.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
                'Vui lòng nhập mã xác nhận đã được gửi tới địa chỉ admin@gmail.com',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: kHeight * 0.03),
              PinInputTextField(
                autoFocus: true,
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                decoration: BoxLooseDecoration(
                  textStyle: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                  strokeColorBuilder: PinListenColorBuilder(AppColors.primary, AppColors.grey),
                ),
                cursor: Cursor(
                  color: AppColors.primary,
                  enabled: true,
                  width: 2,
                ),
                onChanged: (value) {},
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
                  Text(
                    'Gửi lại',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
