import 'package:auto_manager_list/ui/otherPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../bodyPage.dart';
import '../chassisPage.dart';
import '../enginePage.dart';
import '../mainPage.dart';






class Nav_bar extends StatefulWidget {
  const Nav_bar({super.key});

  @override
  State<Nav_bar> createState() => _Nav_barState();
}

class _Nav_barState extends State<Nav_bar> {

  int _curentInxed = 0;

  final tabs = [MainPage(), const BodyPage(), const ClassisPage(), const EnginePage(), const OtherPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,

      bottomNavigationBar: CurvedNavigationBar(
        index: _curentInxed,
        onTap: (index) {
          setState(() {
            _curentInxed = index;
          });
        },
        backgroundColor: Colors.grey.shade800,
        color: Colors.white10,
        height: 75,
        buttonBackgroundColor: Colors.white,
        items: const [
          Icon(Icons.add),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Кузов"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Шасси"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Ходовая"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("?", style: TextStyle(fontSize: 24),),
          ),

        ],),

      body: tabs[_curentInxed],);
  }
}