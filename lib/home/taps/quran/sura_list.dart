import 'package:flutter/material.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/utils/app_styles.dart';

class SuraList extends StatelessWidget {
  SuraModel suraModel;

  SuraList({required this.suraModel});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(vertical: height * 0.015),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/images/vector.png'),
              Text('${suraModel.index + 1}', style: AppStyles.bold20White),
            ],
          ),
          SizedBox(
            width: width * 0.02,
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(suraModel.suraEnglishName,
                        style: AppStyles.bold20White),
                    Text('${suraModel.ayaNumber} Verses',
                        style: AppStyles.bold14White),
                  ],
                ),
                Text(suraModel.suraArabicName, style: AppStyles.bold20White),
              ],
            ),
          )
        ],
      ),
    );
  }
}
