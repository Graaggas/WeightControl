import 'package:flutter/material.dart';
import 'package:weight_control/screens/dashboard-page.dart';
import 'package:weight_control/screens/graphics-page.dart';
import 'package:weight_control/screens/info-page.dart';
import 'package:weight_control/screens/something-page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;

  final List<Widget> screens = [
    GraphicsPage(),
    InfoPage(),
    DashboardPage(),
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
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
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
                              ? Colors.brown
                              : Colors.white,
                        ),
                        Text(
                          "Панель",
                          style: TextStyle(
                            color: currentTab == 0
                                ? Colors.brown
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
                              ? Colors.brown
                              : Colors.white,
                        ),
                        Text(
                          "Графики",
                          style: TextStyle(
                            color: currentTab == 1
                                ? Colors.brown
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
                              ? Colors.brown
                              : Colors.white,
                        ),
                        Text(
                          "О замерах",
                          style: TextStyle(
                            color: currentTab == 2
                                ? Colors.brown
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
                              ? Colors.brown
                              : Colors.white,
                        ),
                        Text(
                          "Что-то",
                          style: TextStyle(
                            color: currentTab == 3
                                ? Colors.brown
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
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
    );
  }
}
