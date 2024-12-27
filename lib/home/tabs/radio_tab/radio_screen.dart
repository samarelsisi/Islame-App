import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../appcolors.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      height: height * .17,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Ibrahim Al-Akdar",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColors.primaryDarkColor),
            ),
            SizedBox(
              height: 30,
            ),
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
          ],
        ),
        Image.asset(
          "assets/images/play.png",
          fit: BoxFit.scaleDown,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
        ),
      ]),
    );
  }
}
