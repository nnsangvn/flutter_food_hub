import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_hub/core/configs/navigation/navigation_cubit.dart';
import 'package:flutter_food_hub/core/configs/navigation/tab_item.dart';
import 'package:flutter_food_hub/core/configs/theme/app_colors.dart';
import 'package:go_router/go_router.dart';

class MainNavigation extends StatefulWidget {
  final Widget screen;

  const MainNavigation({super.key, required this.screen});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: widget.screen,
      bottomNavigationBar: BlocBuilder<NavigationCubit, TabItem>(
        builder: (context, selectedTab) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: AppColors.lightBackground,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.grey,
            currentIndex: selectedTab.index,
            onTap: (index) {
              final tab = TabItem.values[index];
              context.read<NavigationCubit>().selectTab(tab);
              _navigateToTab(context, tab);
            },
            items: TabItem.values.map((tab) {
              final tabInfo = TabItemData.tabInfo[tab]!;
              return BottomNavigationBarItem(
                icon: Icon(tabInfo.icon),
                label: tabInfo.label,
              );
            }).toList(),
          );
        },
      ),
    );
  }

  void _navigateToTab(BuildContext context, TabItem tab) {
    final tabInfo = TabItemData.tabInfo[tab]!;
    context.goNamed(tabInfo.route);
  }
}
