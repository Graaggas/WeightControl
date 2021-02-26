import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:weight_control/screens/graphics-page.dart';
import 'package:weight_control/screens/info-page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentTab = 0;

  final List <Widget> screens = [
    GraphicsPage(),
    InfoPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.lightBlue,
        overlayColor: Colors.black87,
        animatedIcon: AnimatedIcons.add_event,
        animatedIconTheme: IconThemeData.fallback(),
        elevation: 8,
        children: [
          SpeedDialChild(
            child: Icon(Icons.line_weight),
            label: "Вес",
            backgroundColor: Colors.lightBlue,
          ),
          SpeedDialChild(
            child: Icon(Icons.height),
            label: "Объем талии",
            backgroundColor: Colors.lightBlue,
            onTap: () => print("waist tapped"),
          ),
        ],
      ),
      body: Center(
        child: Text("Text"),
      ),
    );
  }
}
