import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/model/hadeth_model.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadeth_details_screen';

  @override
  Widget build(BuildContext context) {
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
              const SizedBox(
                height: 17,
              ),
              Text(
                args.hadethTitle,
                style:
                    const TextStyle(color: AppColors.primaryDark, fontSize: 24),
              ),
              SizedBox(
                height: 540,
                child: ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: args.hadethContent.length,
                    itemBuilder: (context, index) {
                      return Text(
                        '${args.hadethContent}',
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          color: AppColors.primaryDark,
                          fontSize: 16,
                        ),
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
