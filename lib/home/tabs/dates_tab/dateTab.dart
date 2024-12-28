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
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("assets/images/onboarding_header.png"),
          const SizedBox(
            height: 5,
          ),
        Column(
          children: [
            Container(
              height: height*.35,
              width: width*.9,
              decoration: BoxDecoration(
                color: AppColors.brownColor,
                borderRadius: BorderRadius.circular(40)
              ),
              child:Stack(

                children: [
                  Image.asset('assets/images/shape.png',fit: BoxFit.cover,height:double.maxFinite,),
                  Positioned(
                      top:16
                      ,
                      left: 10,
                      child: Text("16 Jul \n 2024",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.whiteColor),)),
                  Positioned(
                      top: 16,
                      left: width*.3,
                      child: Container(
                        height:height*.35 ,
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text("Pray Time",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.brownColor),),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text("Tuesday",style:Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.primaryDarkColor) ,),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                   ],
                                 )
                              ],
                            ),
                        ),
                      ),
                  Positioned(
                      top: 16,
                      right: 2,
                      child: Text("09 Muh \n 1446",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.whiteColor),)),
                ],
              ),
            )
          ],
        )
        ],
      ),
    );
  }
}


