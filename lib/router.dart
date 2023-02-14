import 'package:flutter/material.dart';
import 'package:hpets/view/bottom_navigation_bar/add_new_pet.dart';
import 'package:hpets/view/profile/asked_questions.dart';
import 'package:hpets/view/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:hpets/view/profile/profile.dart';
import 'package:hpets/view/register.dart';
import 'package:hpets/view/splash_screen.dart';
import 'package:hpets/view/login.dart';
import 'package:hpets/view/bottom_navigation_bar/user_home.dart';

var routes = <String, WidgetBuilder>{
  '/login' : (context) => const LoginPage(),
  '/splash' : (context) => const SplashScreen(),
  '/register' : (context) => const RegisterPage(),
  '/userhome' : (context) => const UserHomePage(),
  '/addnewpet' : (context) => const AddNewPet(),
  '/bottomnav' : (context) => const BottomNavigation(),
  '/profile'  : (context) => const ProfilePage(),
  '/askedquestions' : (context) => const AskedQuestionsPage(),
  // '/petdetail' : (context) => PetDetailPage(),

};