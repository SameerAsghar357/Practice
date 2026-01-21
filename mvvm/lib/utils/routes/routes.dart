import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:mvvm/view/moviesListScreen.dart';
import 'package:mvvm/view/login.dart';
import 'package:mvvm/view/signup.dart';
import 'package:mvvm/view/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.home:
        return MaterialPageRoute(builder: (context) => moviesListScreen());
      case RoutesNames.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RoutesNames.signup:
        return MaterialPageRoute(builder: (context) => SignupScreen());
      case RoutesNames.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      default:
        return MaterialPageRoute(builder: (context) => LoginScreen());
    }
  }
}
