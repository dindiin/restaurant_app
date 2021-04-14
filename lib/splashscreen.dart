import 'package:flutter/material.dart';
import 'package:restaurant_app/page/list_page.dart';
import 'dart:async';

import 'package:restaurant_app/style/style.dart';

class SplashScreenPage extends StatefulWidget {
  static const routeName = '/splashscreen';
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return RestoListPage();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Image.asset(
          "images/ala-resto.png",
          width: 200.0,
          height: 100.0,
        ),
      ),
    );
  }
}
