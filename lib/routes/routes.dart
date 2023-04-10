import 'package:ecommerce_app/core/middleware/middleware.dart';
import 'package:ecommerce_app/view/auth/login_view.dart';

import 'package:ecommerce_app/view/auth/register_view.dart';
import 'package:ecommerce_app/view/home_view.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(
        name: login,
        page: () => const LoginView(),
        middlewares: [AuthMiddleWare()]),
    GetPage(
      name: register,
      page: () => Registerview(),
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
    ),
  ];

  static String login = '/login';
  static String register = '/register';
  static String home = '/home';
}
