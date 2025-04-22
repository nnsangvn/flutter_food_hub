import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_hub/core/configs/navigation/navigation_cubit.dart';
import 'package:flutter_food_hub/core/configs/routes/app_router.dart';
import 'package:go_router/go_router.dart';

class HomePages extends StatefulWidget {
  final Widget screen;

  const HomePages({super.key, required this.screen});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Hub'),
        centerTitle: true,
      ),
      body: widget.screen,
      bottomNavigationBar: BlocBuilder<NavigationCubit, int>(
        builder: (context, selectedTab) {
          return BottomNavigationBar(
            currentIndex: selectedTab,
            onTap: (index) {
              context.read<NavigationCubit>().selectTab(index);
              _navigateToTab(context, index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Trang chủ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Giỏ hàng',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Hồ sơ',
              ),
            ],
          );
        },
      ),
    );
  }

  void _navigateToTab(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.goNamed(AppRouter.home);
      case 1:
        context.goNamed(AppRouter.cart);
      case 2:
        context.goNamed(AppRouter.profile);
    }
  }
}
