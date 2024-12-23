import 'package:flutter/material.dart';
import 'package:islami_app/home/taps/hadeth/hadeth_screen.dart';
import 'package:islami_app/home/taps/quran/quran_screen.dart';
import 'package:islami_app/home/taps/radio/radio_screen.dart';
import 'package:islami_app/home/taps/sebha/sebha_screen.dart';
import 'package:islami_app/home/taps/time/time_screen.dart';
import 'package:islami_app/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeSCreen_route';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> icons = [
    'icon_quran',
    'icon_hadeth',
    'icon_sebha',
    'icon_radio',
    'icon_time',
  ];
  List<String> bgImages = [
    'assets/images/quran_bg.png',
    'assets/images/hadeth_bg.png',
    'assets/images/sebha_bg.png',
    'assets/images/radio_bg.png',
    'assets/images/time_bg.png',
  ];
  List<Widget> tapsWidgets = [
    QuranScreen(),
    HadethScreen(),
    SebhaScreen(),
    RadioScreen(),
    TimeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          bgImages[selectedIndex],
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon: tapLayout(index: 0, iconName: icons[0]),
                  label: 'Quran',
                ),
                BottomNavigationBarItem(
                  icon: tapLayout(index: 1, iconName: icons[1]),
                  label: 'Hadeth',
                ),
                BottomNavigationBarItem(
                  icon: tapLayout(index: 2, iconName: icons[2]),
                  label: 'Sebha',
                ),
                BottomNavigationBarItem(
                  icon: tapLayout(index: 3, iconName: icons[3]),
                  label: 'Radio',
                ),
                BottomNavigationBarItem(
                  icon: tapLayout(index: 4, iconName: icons[4]),
                  label: 'Time',
                ),
              ]),
          body: tapsWidgets[selectedIndex],
        )
      ],
    );
  }

  Widget tapLayout({required int index, required String iconName}) {
    return selectedIndex == index
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 19),
            decoration: BoxDecoration(
              color: AppColors.transperntBlack,
              borderRadius: BorderRadius.circular(66),
            ),
            child: ImageIcon(
              AssetImage('assets/images/$iconName.png'),
            ),
          )
        : ImageIcon(AssetImage('assets/images/$iconName.png'));
  }
}
