import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/appcolors.dart';
import 'package:project/home/tabs/radio_tab/radio_screen.dart';

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
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 16,
            ),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index){
              return RecordScreen(height: height);
            },
           itemCount: 10,
          ),
        )

      ],
    );
  }
}


