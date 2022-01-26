import 'package:dokan_clone/screens/signup_screen.dart';
import 'package:dokan_clone/screens/test_bottom_bar.dart';

import '/screens/signin_screen.dart';
import '/screens/home_screen.dart';
import '/screens/my_bottom_bar.dart';
import '/screens/search_screen.dart';
import '/screens/setting_screen.dart';


routes() {
  return {
    SignUpScreen.route: (context) => SignUpScreen(),
    SignInScreen.route: (context) => SignInScreen(),
    MyBottomBar.route: (context) => MyBottomBar(),
    TestBottomBar.route: (context) => TestBottomBar(),
    HomePage.route: (context) => HomePage(),
    SearchScreen.route: (ctx) => SearchScreen(data: 4),
    SettingScreen.route: (ctx) => SettingScreen(),
  };
}
