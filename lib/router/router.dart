import 'package:flutter/material.dart';
import 'package:travel_admin/view/auth/login.dart';
import 'package:travel_admin/view/dashboard/dashboard.dart';
import 'package:travel_admin/view/post/post.dart';
import 'package:travel_admin/view/user/user.dart';

class RouteAPI {
  static const home = "/";
  static const login = "/login";
  static const register = "/register";
  static const bottom = "/bottom";
  static const manage_user = "/user";
  static const post = "/post";
  static const dashboard = "/dashboard";
  static const splashscreen = "/splashscreen";

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );

      case login:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case post:
        return MaterialPageRoute(
          builder: (context) => const PostView(),
        );
      case manage_user:
        return MaterialPageRoute(
          builder: (context) => const UserView(),
        );

      case dashboard:
        return MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        );
      default:
        throw const FormatException("Route not found!");
    }
  }
}
