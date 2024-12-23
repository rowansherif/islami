import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class RadioListWidget extends StatelessWidget {
  var height;
  var width;

  RadioListWidget({required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.14,
      width: width * 0.9,
      decoration: BoxDecoration(
          color: AppColors.primaryDark,
          image: DecorationImage(
              image: AssetImage('assets/images/radio_sound_bg.png'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Radio Ibrahim Al-Akdar',
            style: AppStyles.bold20Black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                AssetImage('assets/images/heart_on.png'),
                color: AppColors.blackColor,
                size: 32,
              ),
              SizedBox(
                width: width * 0.05,
              ),
              ImageIcon(
                AssetImage('assets/images/radio_on.png'),
                color: AppColors.blackColor,
                size: 32,
              ),
              SizedBox(
                width: width * 0.05,
              ),
              ImageIcon(
                AssetImage('assets/images/volum_high.png'),
                color: AppColors.blackColor,
                size: 32,
              )
            ],
          )
        ],
      ),
    );
  }
}
