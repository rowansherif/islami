import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';

class SebhaScreen extends StatefulWidget {
  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;
  List<String> tsabeh = ['سبحان الله', 'الحمد لله', 'الله اكبر'];
  String sebhaText = '';
  double finalAngle = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/islami_logo.png'),
          const Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
            style: TextStyle(color: AppColors.whiteColor, fontSize: 36),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Transform.rotate(
                  angle: finalAngle,
                  origin: Offset(0, 0),
                  //alignment: Alignment.center,
                  child: Image.asset('assets/images/sebha_image.png')),
              Container(
                margin: const EdgeInsets.only(top: 70),
                child: Column(
                  children: [
                    Text(
                      sebhaText,
                      style: const TextStyle(
                          color: AppColors.whiteColor, fontSize: 36),
                    ),
                    TextButton(
                      onPressed: () {
                        if (counter < 100) {
                          if (counter < 33) {
                            sebhaText = tsabeh[0];
                          } else if (counter < 66) {
                            sebhaText = tsabeh[1];
                          } else if (counter < 99) {
                            sebhaText = tsabeh[2];
                          }
                          counter++;
                          setState(() {
                            finalAngle += 0.2;
                          });
                        }
                      },
                      child: Text(
                        '$counter',
                        style: TextStyle(
                            color: AppColors.whiteColor, fontSize: 36),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
