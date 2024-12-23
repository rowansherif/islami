import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/model/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details_screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String sura = '';

  @override
  Widget build(BuildContext context) {
    SuraModel args = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (sura.isEmpty) {
      loadSuraFiles(args.index);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.suraEnglishName,
          style: const TextStyle(color: AppColors.primaryDark),
        ),
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
              const SizedBox(
                height: 17,
              ),
              Text(
                args.suraArabicName,
                style:
                    const TextStyle(color: AppColors.primaryDark, fontSize: 24),
              ),
              Expanded(
                child: SizedBox(
                  //height:460,
                  child: sura.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: AppColors.primaryDark,
                        ))
                      : ListView.builder(
                          padding: const EdgeInsets.all(20),
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Text(
                              sura,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                color: AppColors.primaryDark,
                                fontSize: 16,
                              ),
                            );
                          }),
                ),
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
