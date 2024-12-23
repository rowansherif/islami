import 'package:flutter/material.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'sura_details_screen.dart';
import 'sura_list.dart';

class QuranScreen extends StatefulWidget {
  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  void fillSuraList() {
    for (int i = 0; i < 114; i++) {
      SuraModel.suraList.add(SuraModel(
          suraArabicName: SuraModel.suraArabicNameList[i],
          suraEnglishName: SuraModel.suraEnglishNameList[i],
          ayaNumber: SuraModel.AyaNumberList[i],
          index: i));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fillSuraList();
    loadLastSura();
  }

  Map<dynamic, dynamic> lastSura = {};
  List<SuraModel> filteredList = SuraModel.suraList;
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(
          right: width * 0.03, left: width * 0.03, top: height * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Image.asset(
            'assets/images/islami_logo.png',
          )),
          TextField(
            onChanged: (text) {
              searchText = text;
              filteredList = SuraModel.suraList.where((sura) {
                return sura.suraArabicName.contains(searchText) ||
                    sura.suraEnglishName
                        .toLowerCase()
                        .contains(searchText.toLowerCase());
              }).toList();
              setState(() {});
            },
            style: TextStyle(color: AppColors.whiteColor),
            cursorColor: AppColors.primaryDark,
            decoration: InputDecoration(
                prefixIcon: const ImageIcon(
                  AssetImage(
                    'assets/images/textfield_icon.png',
                  ),
                  color: AppColors.primaryDark,
                ),
                hintText: 'Sura Name',
                hintStyle: AppStyles.bold16White,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 2, color: AppColors.primaryDark),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 2, color: AppColors.primaryDark),
                )),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          searchText.isNotEmpty
              ? SizedBox()
              : mostRecentlyWidget(height, width),
          Text(
            'Suras List',
            style: TextStyle(color: AppColors.whiteColor),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      saveLastSura(
                          suraEnName: SuraModel.suraEnglishNameList[index],
                          suraArName: SuraModel.suraArabicNameList[index],
                          numberOfVerses: SuraModel.AyaNumberList[index],
                          index: index);
                      Navigator.pushNamed(context, SuraDetailsScreen.routeName,
                          arguments: filteredList[index]);
                    },
                    child: SuraList(
                      suraModel: filteredList[index],
                    ));
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.whiteColor,
                  indent: 30,
                  endIndent: 30.50,
                  thickness: 2,
                  height: 5,
                );
              },
              itemCount: filteredList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget mostRecentlyWidget(var height, var width) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
            arguments: filteredList[lastSura['index']]);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Most Recently',
            style: TextStyle(color: AppColors.whiteColor),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            height: height * 0.16,
            padding: EdgeInsets.symmetric(
                vertical: height * 0.01, horizontal: width * 0.01),
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lastSura['suraEnName'] ?? '',
                      style: AppStyles.bold24Black,
                    ),
                    Text(
                      lastSura['suraArName'] ?? '',
                      style: AppStyles.bold24Black,
                    ),
                    Text(
                      '${lastSura['numberOfVerses'] ?? ''} verses',
                      style: AppStyles.bold16Black,
                    ),
                  ],
                ),
                Image.asset('assets/images/quran_container_image.png')
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
        ],
      ),
    );
  }

  Future<void> saveLastSura(
      {required String suraEnName,
      required String suraArName,
      required String numberOfVerses,
      required int index}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('suraEnName', suraEnName);
    await prefs.setString('suraArName', suraArName);
    await prefs.setString('numberOfVerses', numberOfVerses);
    await prefs.setInt('index', index);
    loadLastSura();
  }

  Future<Map<dynamic, dynamic>> getLastSura() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String suraEnName = prefs.getString('suraEnName') ?? '';
    String suraArName = prefs.getString('suraArName') ?? '';
    String numberOfVerses = prefs.getString('numberOfVerses') ?? '';
    int? index = prefs.getInt('index');

    return {
      'suraEnName': suraEnName,
      'suraArName': suraArName,
      'numberOfVerses': numberOfVerses,
      'index': index,
    };
  }

  loadLastSura() async {
    lastSura = await getLastSura();
    setState(() {});
  }
}
