import 'package:auto_manager_list/ui/components/navBar.dart';
import 'package:auto_manager_list/ui/mainPage.dart';
import 'package:auto_manager_list/ui/otherPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade800)),
      routes: {
        // "runs": (context) => MarqueeWidgetDemo(),

         "mainPage": (context) => MainPage(),
          "navBar": (context) => Nav_bar(),
        "other": (context) => OtherPage(),

        //   "/json": (context) => Example2(),
      },
      initialRoute: "navBar",

    );
  }
}