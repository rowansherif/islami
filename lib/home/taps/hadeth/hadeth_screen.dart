import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/hadeth_model.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

import 'hadeth_details_screen.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<HadethModel> hadethList = [];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    if (hadethList.isEmpty) {
      loadHadethContent();
    }

    return hadethList.isEmpty
        ? const Center(
            child: CircularProgressIndicator(
            color: AppColors.primaryDark,
          ))
        : Padding(
            padding: EdgeInsets.only(top: height * 0.03),
            child: Column(
              children: [
                Image.asset('assets/images/islami_logo.png'),
                CarouselSlider.builder(
                    options: CarouselOptions(
                      height: height * 0.66,
                      viewportFraction: 0.75,
                      scrollDirection: Axis.horizontal,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                    ),
                    itemCount: hadethList.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, HadethDetailsScreen.routeName,
                              arguments: hadethList[itemIndex]);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.04,
                              vertical: height * 0.04),
                          decoration: BoxDecoration(
                              color: AppColors.primaryDark,
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/hadeth_pageview_bg.png'),
                                  fit: BoxFit.fill)),
                          child: Column(
                            children: [
                              Text(hadethList[itemIndex].hadethTitle,
                                  style: AppStyles.bold24Black),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Expanded(
                                  child: Text(
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                hadethList[itemIndex].hadethContent.join(''),
                                style: AppStyles.bold16Black,
                              ))
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          );
  }

  Future<void> loadHadethContent() async {
    for (int i = 1; i <= 50; i++) {
      String hadethContent =
          await rootBundle.loadString('assets/files/h$i.txt');
      List<String> hadethLines = hadethContent.split('\n');
      String hadethTitle = hadethLines[0];
      hadethLines.removeAt(0);
      HadethModel hadethModel =
          HadethModel(hadethTitle: hadethTitle, hadethContent: hadethLines);
      hadethList.add(hadethModel);
    }
    setState(() {});
  }
}
