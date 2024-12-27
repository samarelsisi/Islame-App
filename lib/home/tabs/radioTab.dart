import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/appcolors.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset("assets/images/onboarding_header.png"),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Radio",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.primaryDarkColor)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Reciters",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w200)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blackColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          height: height * .17,
          padding: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Radio Ibrahim Al-Akdar",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.primaryDarkColor),
              ),
              SizedBox(
                height: 30,
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                  children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.play_arrow_rounded),
                      color: AppColors.primaryDarkColor,
                      iconSize: 50,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.volume_up),
                      color: AppColors.primaryDarkColor,
                      iconSize: 30,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                    child: Image.asset(
                  "assets/images/play.png",
                  fit: BoxFit.cover,
                  width: double.infinity,


                ))
              ])
            ],
          ),
        )
      ],
    );
  }
}
