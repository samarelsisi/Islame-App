import 'package:flutter/material.dart';
import 'package:project/provider/radio_manger_provider.dart';
import 'package:provider/provider.dart';
import '../../../appcolors.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({
    super.key,
    required this.height,
    required this.name,
    required this.url
  });

  final String name;
  final double height;
  final String url;

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  // bool onClick = false;
  bool isFav = false;
  bool volumeUp=true;
  @override
  Widget build(BuildContext context) {
    return Consumer<RadioManagerProvider>(
      builder: (context,RadioManagerProvider provider, child) {
        return  Container(
          padding: const EdgeInsets.only(top: 10),
          height: widget.height * .17,
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                "assets/images/play.png",
                fit: BoxFit.scaleDown,
                width: double.infinity,
                alignment: Alignment.bottomCenter,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.name,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.primaryDarkColor,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isFav = !isFav;
                          });
                        },
                        icon: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                        ),
                        color: AppColors.primaryDarkColor,
                        iconSize: 30,
                      ),
                      IconButton(
                        onPressed: () {
                          provider.play(widget.url);
                        },
                        icon: Icon(
                          ( provider.currentPlaying==widget.url &&provider.isPlaying)
                              ? Icons.pause
                              : Icons.play_arrow_rounded,
                        ),
                        color: AppColors.primaryDarkColor,
                        iconSize: 50,
                      ),
                      IconButton(onPressed:
                      (){
                        if(provider.currentPlaying==widget.url){
                          provider.stop();
                        }
                      }
                      ,icon:Icon(Icons.stop),
                        iconSize: 30,
                      color: AppColors.blackColor,
                      ),

                      const SizedBox(width: 5),
                      IconButton(
                        onPressed: () {
                          volumeUp = !volumeUp;
                          provider.setVolume(volumeUp ? 1.0 : 0.0); // ✅ valid range
                          setState(() {});
                        },
                        icon: Icon(
                          volumeUp ? Icons.volume_up : Icons.volume_off_rounded,
                          color: AppColors.primaryDarkColor,
                          size: 30,
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      } ,

    );
  }
}
