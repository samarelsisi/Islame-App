import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/appcolors.dart';
import 'package:project/home/tabs/dates_tab/PrayTime.dart';

class DateTab extends StatelessWidget {
  const DateTab({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("assets/images/onboarding_header.png"),
          const SizedBox(
            height: 5,
          ),
        Container(
          height: height*.35,
          width: width*.9,
          decoration: BoxDecoration(
            color: AppColors.brownColor,
            borderRadius: BorderRadius.circular(40)
          ),
          child:Stack(
            children: [
              Positioned.fill(
                  child: Image.asset('assets/images/shape.png',fit: BoxFit.cover,height:double.infinity,)),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      Text("16 Jul \n 2024",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.whiteColor),),
                      Text("Pray Time",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.brownColor),),
                      Text("09 Muh \n 1446",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.whiteColor),),
                    ],
                  )
                  ,
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("Tuesday",style:Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.primaryDarkColor) ,),
                       ],
                     ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: height*.15,
                          width: width*.5 ,
                          child: PrayTime())
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Next Pray - 02:32",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.primaryDarkColor),),

                      SizedBox( width:width*.3,child: Icon(Icons.volume_off_rounded,))
                    ],
                  )
                ],
              ) ,
            ],
          ),
        ),
          SizedBox(
            height:10 ,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Azkar",style:Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.whiteColor) ,),
            ],
          ),
          SizedBox(
            height:10 ,
          ),
          SizedBox(
            height: height*.2,
            child: GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                InkWell(child: Image.asset('assets/images/Evening_azkar.png',fit: BoxFit.fill,),onTap: (){},),
                InkWell(child: Image.asset('assets/images/morning_azkar.png',fit: BoxFit.fill),onTap: (){},),
                InkWell(child: Image.asset('assets/images/sleeping_azkar.png',fit: BoxFit.fill),onTap: (){},),
                InkWell(child: Image.asset('assets/images/Waking_azkar.png',fit: BoxFit.fill),onTap: (){},),
              ],

            ),
          )
        ],
      ),
    );
  }
}


