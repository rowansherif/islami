import 'package:flutter/material.dart';
import 'package:islami_app/model/hadeth_model.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadeth_details_screen';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    HadethModel args =
        ModalRoute.of(context)!.settings.arguments as HadethModel;
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: AppColors.blackColor,
            child: Image.asset(
              'assets/images/details_bg.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              Text(args.hadethTitle, style: AppStyles.bold24Primary),
              SizedBox(
                height: height * 0.72,
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.05, horizontal: width * 0.06),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Text(
                        '${args.hadethContent}',
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: AppStyles.bold20Primary,
                      );
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
