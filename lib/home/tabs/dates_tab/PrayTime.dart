import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';  // Import carousel_slider package
import '../../../appcolors.dart'; // Make sure this path is correct for your AppColors

class PrayTime extends StatelessWidget {
  const PrayTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Prayer names and their corresponding times
    List<String> prays = [
      "Fajr",
      "Dhuhr",
      "Asr",
      "Maghrib",
      "Isha"
    ];
    List<String> times = [
      "05:00 AM",
      "12:15 PM",
      "03:45 PM",
      "06:30 PM",
      "08:00 PM"
    ];

    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [AppColors.primaryDarkColor, AppColors.gradientColor],
        ),
      ),
      child: CarouselSlider(
        items: prays.asMap().entries.map((entry) {
          int index = entry.key;
          return Builder(builder:(BuildContext context){
            return
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${prays[index]}",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    times[index],
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              );
          }

          );
        }).toList(),
        options: CarouselOptions(
          height: double.infinity
           // Show part of the previous and next item
        ),
      ),
    );
  }
}
