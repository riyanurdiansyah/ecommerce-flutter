import 'package:ecommerce_flutter/pages/login_page.dart';
import 'package:ecommerce_flutter/pages/register_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
          settings: routeSettings(settings),
          builder: (context) => const LoginPage());

    case '/register':
      return MaterialPageRoute(
          settings: routeSettings(settings),
          builder: (context) => const RegiisterPage());

    default:
      return MaterialPageRoute(
          settings: routeSettings(settings),
          builder: (context) => const RegiisterPage());
  }
}

RouteSettings routeSettings(RouteSettings settings) =>
    RouteSettings(name: settings.name);
