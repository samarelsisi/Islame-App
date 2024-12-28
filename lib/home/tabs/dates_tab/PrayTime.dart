import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';  // Import carousel_slider package
import '../../../appcolors.dart';

class PrayTime extends StatelessWidget {
  const PrayTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [AppColors.primaryDarkColor, AppColors.gradientColor],
        ),
      ),
      child: CarouselSlider.builder(
        itemCount: prays.length,
        itemBuilder: (context, index, realIndex) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${prays[index]}",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  times[index], // Corresponding time for the prayer
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          );
        },
        options: CarouselOptions(
          height: 200,
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          aspectRatio: 2.0,
          viewportFraction: 0.8,
        ),
      ),
    );
  }
}
