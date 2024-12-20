import 'package:flutter/material.dart';
import 'package:project/home/homeScreen.dart';
import 'package:project/home/introduction_screen.dart';
import 'package:project/mytheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OnboardingScreen.routeName,
      routes: {
        OnboardingScreen.routeName:(context)=>OnboardingScreen(),
        HomeScreen.routeName: (context) => HomeScreen()
      },
      darkTheme: MyTheme.dartTheme,
      themeMode:ThemeMode.dark,
    );
  }
}


