import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/appcolors.dart';
class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}
class _SebhaTabState extends State<SebhaTab> {
  double angle = 0;
  int counter = 0;
  int index=0;
  List<String> Tasbeh = ['الله اكبر', ' الحمد لله', 'سبحان الله'];
  void _rotateImage() {
    setState(() {
      angle += 0.19;
      counter++;
      print(counter);
    });
  }
  void _resetCounter(){
    setState(() {
      if(counter==34){
        if(index<Tasbeh.length-1){
          index++;
        }
        else{
          index=0;
        }

        counter=0;
        angle=0;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
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
          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
            style: GoogleFonts.elMessiri(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  _rotateImage();
                  _resetCounter();
                },
                child: Transform.rotate(
                    angle: angle,
                    child: Image.asset('assets/images/SebhaCounter.png')),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "${Tasbeh[index]} \n ${counter}",
                style: GoogleFonts.elMessiri(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              )
            ],
          )
        ],
      ),
    );
  }
}
