import 'package:flutter/material.dart';
import 'package:restaurant_app/page/detail_page.dart';
import 'package:restaurant_app/page/list_page.dart';
import 'package:restaurant_app/splashscreen.dart';
import 'package:restaurant_app/style/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ala Resto',
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: secondaryColor,
        scaffoldBackgroundColor: Colors.white,
        textTheme: myTextTheme,
        appBarTheme: AppBarTheme(
          textTheme: myTextTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: SplashScreenPage.routeName,
      routes: {
        SplashScreenPage.routeName: (context) => SplashScreenPage(),
        RestoListPage.routeName: (context) => RestoListPage(),
        RestoDetailPage.routeName: (context) => RestoDetailPage(
              resto: ModalRoute.of(context).settings.arguments,
            ),
      },
    );
  }
}
