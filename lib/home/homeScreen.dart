import 'package:flutter/material.dart';
import 'package:project/appcolors.dart';
import 'package:project/home/tabs/ahadethTab.dart';
import 'package:project/home/tabs/dateTab.dart';
import 'package:project/home/tabs/quranTab.dart';
import 'package:project/home/tabs/radioTab.dart';
import 'package:project/home/tabs/sebhaTab.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        'assets/images/${getBackgroundImageName()}.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: AppColors.primaryColor),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: bulidItemButtonNavBar(index: 0, imageName: "quran"),
                  label: "Quran"),
              BottomNavigationBarItem(
                  icon: bulidItemButtonNavBar(index: 1, imageName: "ahadeth"),
                  label: "Ahadeth"),
              BottomNavigationBarItem(
                  icon: bulidItemButtonNavBar(index: 2, imageName: "sebha"),
                  label: "Sebha"),
              BottomNavigationBarItem(
                  icon: bulidItemButtonNavBar(index: 3, imageName: 'ic_radio'),
                  label: "Radio"),
              BottomNavigationBarItem(
                  icon: bulidItemButtonNavBar(index: 4, imageName: 'date'),
                  label: "Data"),
            ],
          ),
        ),
        body: tabs[selectedIndex],
      )
    ]);
  }
  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    DateTab()
  ];

  String getBackgroundImageName() {
    switch (selectedIndex) {
      case 0:
        return "home_bg";
      case 1:
        return "ahadeth_bg";
      case 2:
        return "sebha_bg";
      case 3:
        return "radio_bg";

      default:
        return "home_bg";
    }
  }

  Widget bulidItemButtonNavBar(
      {required int index, required String imageName}) {
    return selectedIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(66)),
                color: AppColors.blackColor),
            child: ImageIcon(AssetImage('assets/images/$imageName.png')),
          )
        : ImageIcon(AssetImage('assets/images/$imageName.png'));
  }
}
