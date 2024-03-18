import 'package:auto_manager_list/ui/components/navBar.dart';
import 'package:auto_manager_list/ui/mainPage.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade800)),
      routes: {
        // "runs": (context) => MarqueeWidgetDemo(),

         "mainPage": (context) => MainPage(),
          "navBar": (context) => Nav_bar(),

        //   "/json": (context) => Example2(),
      },
      initialRoute: "navBar",

    );
  }
}