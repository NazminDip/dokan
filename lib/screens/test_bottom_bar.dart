import 'package:dokan_clone/screens/search_screen.dart';
import 'package:dokan_clone/screens/setting_screen.dart';

import 'package:flutter/material.dart';


import 'account_screen.dart';
import 'home_screen.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';



class TestBottomBar extends StatefulWidget {
  static String route = 'MyBottomBar';
  const TestBottomBar({Key? key}) : super(key: key);

  @override
  _MyBottomBarState createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<TestBottomBar> {
  int _currentIndex = 0;

  List<Widget> _children = [
    // SignInScreen(),
    HomePage(),
    HomePage(),
    SearchScreen(data: 3),
    SettingScreen(),
    AccountScreen(),
  ];

  void onBottomBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    IconData iconData;

    final FluidNavBarIcons = <FluidNavBarIcon>[FluidNavBarIcon(svgPath: "assets/images/home.svg"),FluidNavBarIcon(svgPath: "assets/images/categories.svg"),FluidNavBarIcon(svgPath: "assets/images/search_2.svg"),FluidNavBarIcon(svgPath: "assets/images/cart.svg"),FluidNavBarIcon(svgPath: "assets/images/person.svg")];
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: FluidNavBar(

                 style: FluidNavBarStyle(iconBackgroundColor: Colors.white,iconSelectedForegroundColor: Colors.deepOrangeAccent,iconUnselectedForegroundColor:  Colors.blueGrey),
                onChange: onBottomBarTap,

                icons: FluidNavBarIcons,



      ),
    );
  }
}
