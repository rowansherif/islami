import 'package:flutter/material.dart';
import 'package:islami_app/home/home_screen.dart';

import 'my_app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        //SuraDetailsScreen.routeName : (context) => SuraDetailsScreen(),
        //HadethDetailsScreen.routeName : (context) => HadethDetailsScreen(),
      },
      theme: MyAppTheme.theme,
    );
  }
}
