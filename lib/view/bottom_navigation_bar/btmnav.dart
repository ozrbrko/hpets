import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hpets/core/constants/colors.dart';
import 'package:hpets/view/bottom_navigation_bar/appointments_page.dart';
import 'package:hpets/view/bottom_navigation_bar/guide.dart';
import 'package:hpets/view/bottom_navigation_bar/user_home.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int _tabIndex = 1;
  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  late PageController pageController;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    UserHomePage(),
    AppointmentPage(),
    // VaccinePage(),
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
      extendBody: true,
      bottomNavigationBar: CircleNavBar(
        activeIcons:  [
          Icon(Icons.date_range_outlined, color: AppColors.appThemeClr),
          Icon(Icons.home, color: AppColors.appThemeClr),
          Icon(Icons.info_outline_rounded, color: AppColors.appThemeClr),
        ],
        inactiveIcons: const [
          Text("Appointment",style: TextStyle(fontSize: 15),),
          Text("Home",style: TextStyle(fontSize: 15),),
          Text("Guide",style: TextStyle(fontSize: 15),),
        ],
        color: Colors.white,
        height: 60,
        circleWidth: 60,
        activeIndex: tabIndex,
        onTap: (index) {
          tabIndex = index;
          pageController.jumpToPage(tabIndex);
        },
        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(0),
          bottomLeft: Radius.circular(0),
        ),
        shadowColor: Colors.grey,
        elevation: 10,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (v) {
          tabIndex = v;
        },
        children: [
          AppointmentPage(),
          UserHomePage(),
          GuidePage(),
        ],
      ),
    );
  }
}
