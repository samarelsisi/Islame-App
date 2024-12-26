import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/appcolors.dart';
import '../../../models/hadeth_model.dart';
import 'hadeth_details.dart';

class AhadethTab extends StatefulWidget {
  AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    // Define maxLines based on orientation and screen size
    int maxLines;
    if (isPortrait) {
      // In portrait mode
      maxLines = (width < 600 ) ? 7: 12;  // Allow 2 lines on small screens, 3 on larger screens
    } else {
      // In landscape mode
      maxLines = 10;  // Allow 3 lines in landscape mode
    }
    if (allAhadeth.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Image.asset("assets/images/onboarding_header.png"),

        Expanded(
          child: CarouselSlider(
            options: CarouselOptions(height: double.infinity),
            items: allAhadeth.map((hadeth) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context,
                          HadethDetailsScreen.routeName,
                          arguments: hadeth
                      );
                    },
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset(
                          "assets/images/hadeth_bg.png",
                          width:double.infinity,
                          height: height*.7,
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: height*.1),
                              child: Text(
                                hadeth.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color:  AppColors.primaryDarkColor),
                              ),
                            ),
                            SizedBox(
                              height: height*.05,
                            ),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:width*.1),
                                child: Text(
                                  hadeth.content.first,
                                  textAlign: TextAlign.center,
                                  maxLines: maxLines,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: AppColors.primaryDarkColor),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 24,
        )
      ],
    );
  }

  loadHadethFile() {
    rootBundle.loadString("assets/files/ahadeth.txt").then(
          (file) {
        List<String> ahadeth = file.split("#");
        for (String data in ahadeth) {
          List<String> lines = data.trim().split("\n");
          String title = lines[0];
          lines.removeAt(0);
          List<String> content = lines;
          HadethModel hadethModel = HadethModel(title: title, content: content);

          print(title);
          allAhadeth.add(hadethModel);
        }

        setState(() {});
      },
    ).catchError(
          (error) {
        print("Error $error");
      },
    );
  }
}