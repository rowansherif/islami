import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details_screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String sura = '';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    SuraModel args = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (sura.isEmpty) {
      loadSuraFiles(args.index);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(args.suraEnglishName, style: AppStyles.bold20Primary),
      ),
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
              Text(args.suraArabicName, style: AppStyles.bold24Primary),
              SizedBox(
                height: height * 0.7,
                child: sura.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primaryDark,
                      ))
                    : ListView.builder(
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.04, horizontal: width * 0.04),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Text(sura,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: AppStyles.bold20Primary);
                        }),
              )
            ],
          )
        ],
      ),
    );
  }

  void loadSuraFiles(int index) async {
    String suraContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> suraLines = suraContent.split('\n');
    for (int j = 0; j < int.parse(SuraModel.AyaNumberList[index]); j++) {
      sura += '${suraLines[j]}[${j + 1}] ';
    }
    setState(() {});
  }
}
