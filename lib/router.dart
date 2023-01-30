import 'package:flutter/material.dart';
import 'package:hpets/view/register.dart';
import 'package:hpets/view/splash_screen.dart';
import 'package:hpets/view/login.dart';

var routes = <String, WidgetBuilder>{
  '/login' : (context) => const LoginPage(),
  '/splash' : (context) => const SplashScreen(),
  '/register' : (context) => const RegisterPage(),
};