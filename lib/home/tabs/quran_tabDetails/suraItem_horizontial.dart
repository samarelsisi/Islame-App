import 'package:flutter/material.dart';
import 'package:project/appcolors.dart';
import 'package:project/main.dart';
import 'package:project/models/sura_model.dart';

class SuraitemHorizontial extends StatelessWidget {
  SuraModel model;
   SuraitemHorizontial({required this.model,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 410,
    padding: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(color:AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(24),
        )
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(model.nameEn,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color:AppColors.primaryDarkColor)),
              SizedBox(
                height: 8,
              ),
              Text(
                model.nameAr,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.primaryDarkColor),
              ),
              SizedBox(
                height: 8,
              ),
              Text("${model.numOfVerses} Verses",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.primaryDarkColor)),
            ],
          ),
          Image.asset("assets/images/sura_item.png"),
        ],
          )
        ,
    );
  }
}
