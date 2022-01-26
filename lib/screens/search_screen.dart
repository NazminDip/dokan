import 'package:flutter/material.dart';

import 'setting_screen.dart';

class SearchScreen extends StatelessWidget {
  static String route = 'firstSreen';
  int data;
  SearchScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('search Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text(

              data.toString(),
              style: TextStyle(
                fontSize: 40,
                color: Colors.amberAccent,
              ),

            ),

            Text("First Screen"),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, SettingScreen.route);
              },
              child: Text(' go to Second Page'),
            ),
          ],
        ),
      ),
    );
  }
}
