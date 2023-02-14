import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hpets/core/constants/colors.dart';
import 'package:hpets/view/bottom_navigation_bar/appointments_page.dart';
import 'package:hpets/view/bottom_navigation_bar/guide.dart';
import 'package:hpets/view/bottom_navigation_bar/user_home.dart';
import 'package:hpets/view/bottom_navigation_bar/all_vaccines_bottom.dart';
import 'package:line_icons/line_icons.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Color navigationBarColor = Colors.white;
  late PageController pageController;
  int selectedIndex = 0;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    UserHomePage(),
    AppointmentPage(),
    VaccinePage(),
    GuidePage(),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0,left: 8,right: 8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),

              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(0.20),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),

                child: GNav(

                  tabBorderRadius: 30,
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: Colors.white,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: AppColors.appThemeClr,
                  color: AppColors.appThemeClr,
                  tabs: [
                    GButton(
                      icon: Icons.home_outlined,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.date_range_outlined,
                      text: 'Appointment',
                    ),
                    GButton(
                      icon: Icons.vaccines,
                      text: 'Vaccine',
                    ),
                    GButton(
                      icon: Icons.info_outline_rounded,
                      text: 'Guide',
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
