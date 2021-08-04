import 'package:flutter/material.dart';
import 'package:food/pages/main_page.dart';
import 'package:food/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/main': (context) => MainPage(),
      },
    );
  }
}
