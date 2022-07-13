import 'package:ecommerce_flutter/pages/mobile/login_by_phone_page.dart';
import 'package:ecommerce_flutter/pages/mobile/login_page.dart';
import 'package:ecommerce_flutter/pages/mobile/register_page.dart';
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
          builder: (context) => const RegisterPage());

    case '/signin':
      return MaterialPageRoute(
          settings: routeSettings(settings),
          builder: (context) => const LoginPage());

    case '/signin/phone':
      return MaterialPageRoute(
          settings: routeSettings(settings),
          builder: (context) => const LoginByPhonePage());

    default:
      return MaterialPageRoute(
          settings: routeSettings(settings),
          builder: (context) => const RegisterPage());
  }
}

RouteSettings routeSettings(RouteSettings settings) =>
    RouteSettings(name: settings.name);
