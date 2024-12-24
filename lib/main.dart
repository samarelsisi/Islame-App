import 'package:flutter/material.dart';
import 'package:project/home/homeScreen.dart';
import 'package:project/introduction_screen.dart';
import 'package:project/home/sura_details.dart';
import 'package:project/mytheme.dart';
import 'package:device_preview/device_preview.dart';


import 'cache/cache_helper.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(DevicePreview(builder:(context)=> const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      initialRoute: CacheHelper.getEligibility() == true
          ? HomeScreen.routeName
          : OnboardingScreen.routeName,
      routes: {
        OnboardingScreen.routeName:(context)=>OnboardingScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName:(context)=>SuraDetailsScreen()
      },
      darkTheme: MyTheme.dartTheme,
      themeMode:ThemeMode.dark,
    );
  }
}


