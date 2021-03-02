import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weight_control/misc/constants.dart';
import 'package:weight_control/screens/tabs/dashboard/dashboard-page.dart';
import 'file:///C:/FlutterProjects/fromAndroidStudio/weight_control/lib/screens/tabs/graphics-page.dart';
import 'package:weight_control/screens/tabs/info-page.dart';
import 'package:weight_control/screens/tabs/something-page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentTab = 0;

  List<Widget> screens = [
    DashboardPage(),
    GraphicsPage(),
    InfoPage(),
    SomethingPage(),
  ];

  Widget currentScreen = DashboardPage();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(colorTabNav),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(colorTabNav),
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = DashboardPage();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.dashboard,
                          color: currentTab == 0
                              ? Colors.red
                              : Colors.white,
                        ),
                        Text(
                          "Сводная",
                          style: TextStyle(
                            color: currentTab == 0
                                ? Colors.red
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = GraphicsPage();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.graphic_eq,
                          color: currentTab == 1
                              ? Colors.red
                              : Colors.white,
                        ),
                        Text(
                          "Графики",
                          style: TextStyle(
                            color: currentTab == 1
                                ? Colors.red
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = InfoPage();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.info,
                          color: currentTab == 2
                              ? Colors.red
                              : Colors.white,
                        ),
                        Text(
                          "О замерах",
                          style: TextStyle(
                            color: currentTab == 2
                                ? Colors.red
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = SomethingPage();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.face,
                          color: currentTab == 3
                              ? Colors.red
                              : Colors.white,
                        ),
                        Text(
                          "Что-то",
                          style: TextStyle(
                            color: currentTab == 3
                                ? Colors.red
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body:
      PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
    );
  }
}
