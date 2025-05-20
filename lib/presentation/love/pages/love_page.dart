import 'package:flutter/material.dart';
import 'package:flutter_food_hub/common/widget/custom_appbar.dart';
import 'package:flutter_food_hub/core/configs/theme/app_colors.dart';

class LovePage extends StatefulWidget {
  const LovePage({super.key});

  @override
  State<LovePage> createState() => _LovePageState();
}

class _LovePageState extends State<LovePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: CustomAppBar(
        title: 'Favorites',
        actionType: ActionType.favorite,
      ),
      body: Center(
        child: Text('Danh sách yêu thích'),
      ),
    );
  }
}
