import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/model/sura_model.dart';
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
    return Container(
      padding: EdgeInsets.all(12),
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
                hintStyle: const TextStyle(
                  color: AppColors.whiteColor,
                ),
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
          const SizedBox(
            height: 20,
          ),
          searchText.isNotEmpty ? SizedBox() : mostRecentlyWidget(),
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

  Widget mostRecentlyWidget() {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
            arguments: filteredList[lastSura['index'] ?? 0]);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Most Recently',
            style: TextStyle(color: AppColors.whiteColor),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(lastSura['suraEnName'] ?? ''),
                    Text(lastSura['suraArName'] ?? ''),
                    Text('${lastSura['numberOfVerses'] ?? ''} verses'),
                  ],
                ),
                Image.asset('assets/images/quran_container_image.png')
              ],
            ),
          ),
          SizedBox(
            height: 20,
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
    int index = prefs.getInt('index') ?? 0;

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
