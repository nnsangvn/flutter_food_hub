import 'package:flutter/material.dart';
import 'package:flutter_food_hub/common/widget/custom_button.dart';
import 'package:flutter_food_hub/common/widget/custom_input.dart';
import 'package:flutter_food_hub/core/configs/theme/app_colors.dart';

class RessetPw extends StatelessWidget {
  const RessetPw({super.key});

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(kWidth * 0.06),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lấy lại mật khẩu",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: kHeight * 0.02),
                    Text(
                      'Vui lòng nhập địa chỉ email để lấy lại mật khẩu',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.grey),
                    ),
                    SizedBox(height: kHeight * 0.03),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomInput(
                      labelText: "",
                      hintText: "Email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: kHeight * 0.03),
                    CustomButton(
                      onPressed: () {},
                      height: 60,
                      title: "Gửi mật khẩu mới",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
