import 'package:flutter/material.dart';
import 'package:project/appcolors.dart';
class HomeScreen extends StatefulWidget {
  static String routeName="HomeScreen";
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/home_bg.png',width: double.infinity,)
        ,
       Scaffold(
     bottomNavigationBar: Theme(
       data: Theme.of(context).copyWith(
         canvasColor: AppColors.primaryColor
       ),
       child: BottomNavigationBar(
         currentIndex: selectedIndex,
         onTap: (index){
           selectedIndex=index;
           setState(() {
           });
         },
         items: const [
           BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/quran.png')),
           label: "Quran"),
           BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/ahadeth.png')),
           label: "Ahadeth"),
           BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/sebha.png')),
           label: "Sebha"),
           BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/ic_radio.png')),
           label: "Radio"),
           BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/date.png')),
           label: "Data"),
         ],
       ),
     ),
      )
      ]
    );
  }
}
