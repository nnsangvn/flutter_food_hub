import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_hub/core/configs/navigation/navigation_cubit.dart';
import 'package:flutter_food_hub/main_navigation.dart';
import 'package:flutter_food_hub/presentation/auth/pages/signin.dart';
import 'package:flutter_food_hub/presentation/auth/pages/signup.dart';
import 'package:flutter_food_hub/presentation/auth/pages/verify_code.dart';
import 'package:flutter_food_hub/presentation/auth/pages/welcome_page.dart';
import 'package:flutter_food_hub/presentation/cart/pages/cart_page.dart';
import 'package:flutter_food_hub/presentation/home/pages/home_page.dart';
import 'package:flutter_food_hub/presentation/home/pages/home_content.dart';
import 'package:flutter_food_hub/presentation/love/pages/love_page.dart';
import 'package:flutter_food_hub/presentation/noti/pages/noti_page.dart';
import 'package:flutter_food_hub/presentation/notification/pages/notification_page.dart';
import 'package:flutter_food_hub/presentation/profile/pages/profile_page.dart';
import 'package:flutter_food_hub/splash.dart';
import 'package:go_router/go_router.dart';

abstract final class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static const String index = '/';
  static const String splash = '/splash';
  static const String signup = '/signup';
  static const String signin = '/signin';
  static const String verify = '/verify';
  static const String welcome = '/welcome';
  static const String home = '/home';
  static const String cart = '/cart';
  static const String love = '/love';
  static const String noti = '/notification';
  static const String profile = '/profile';

  static final GoRouter _router = GoRouter(
    initialLocation: '/home',
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) => NavigationCubit(),
            child: MainNavigation(screen: child),
          );
        },
        routes: [
          GoRoute(
            path: home,
            name: home,
            builder: (context, state) => const HomeContent(),
          ),
          GoRoute(
            path: cart,
            name: cart,
            builder: (context, state) => const CartPage(),
          ),
          GoRoute(
            path: love,
            name: love,
            builder: (context, state) => const LovePage(),
          ),
          GoRoute(
            path: noti,
            name: noti,
            builder: (context, state) => const NotiPage(),
          ),
          GoRoute(
            path: profile,
            name: profile,
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),
      GoRoute(
        path: index,
        name: index,
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: welcome,
        name: welcome,
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: signin,
        name: signin,
        builder: (context, state) => const SigninPage(),
      ),
      GoRoute(
        path: splash,
        name: splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: signup,
        name: signup,
        builder: (context, state) => const SignupPage(),
      ),
      GoRoute(
        path: verify,
        name: verify,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final email = extra['email'] as String;
          return VerifyCodePage(email: email);
        },
      ),
    ],
  );
  static GoRouter get router => _router;
}
