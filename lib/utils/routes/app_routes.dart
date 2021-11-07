import 'package:apna_khana/screens/home.dart';
import 'package:apna_khana/screens/login_screen.dart';
import 'package:apna_khana/screens/signup_screen.dart';
import 'package:apna_khana/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    signup: (BuildContext context) => SignupScreen(),
    home: (BuildContext context) => MyHomePage(),
  };
}