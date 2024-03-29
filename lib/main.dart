import 'package:flutter/material.dart';
import 'package:flutter_app/constant/app.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: appName),
        '/second': (context) => const SecondScreen()
      },
    );
  }
}
