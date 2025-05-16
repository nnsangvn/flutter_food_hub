import 'package:flutter/material.dart';
import 'package:flutter_food_hub/core/configs/routes/app_router.dart';

enum TabItem {
  home,
  cart,
  love,
  notification,
  profile,
}

class TabInfo {
  final String label;
  final IconData icon;
  final String route;

  const TabInfo({
    required this.label,
    required this.icon,
    required this.route,
  });
}

class TabItemData {
  static const Map<TabItem, TabInfo> tabInfo = {
    TabItem.home: TabInfo(
      label: 'Trang chủ',
      icon: Icons.home,
      route: AppRouter.home,
    ),
    TabItem.cart: TabInfo(
      label: 'Giỏ hàng',
      icon: Icons.shopping_cart,
      route: AppRouter.cart,
    ),
    TabItem.love: TabInfo(
      label: 'Yêu thích',
      icon: Icons.favorite,
      route: AppRouter.love,
    ),
    TabItem.notification: TabInfo(
      label: 'Thông báo',
      icon: Icons.notifications,
      route: AppRouter.noti,
    ),
    TabItem.profile: TabInfo(
      label: 'Hồ sơ',
      icon: Icons.person,
      route: AppRouter.profile,
    ),
  };
}
