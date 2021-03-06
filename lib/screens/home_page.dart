import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weight_control/model/weight/weight_mobx.dart';
import 'package:weight_control/screens/tabs/addingPage/adding-values.dart';
import 'package:weight_control/screens/tabs/dashboard/dashboard-page.dart';
import 'package:weight_control/screens/tabs/graphics-page.dart';

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

  void _nagigateToNew(BuildContext context) async {
    final weightMobx = Provider.of<WeightMobx>(context, listen: false);
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddingValuesPage(), fullscreenDialog: true));
    // AddingValuesPage.show(context);
    // print("result = $result");
    if (result) {
      print("result of pop is true");
      weightMobx.updateCurrentWeight();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () => _nagigateToNew(context),
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
                              ? Colors.deepPurple
                              : Colors.white,
                        ),
                        Text(
                          "Прогресс",
                          style: TextStyle(
                            color: currentTab == 0
                                ? Colors.deepPurple
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
                          LineAwesomeIcons.area_chart,
                          color: currentTab == 1
                              ? Colors.deepPurple
                              : Colors.white,
                        ),
                        Text(
                          "Графики",
                          style: TextStyle(
                            color: currentTab == 1
                                ? Colors.deepPurple
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
                              ? Colors.deepPurple
                              : Colors.white,
                        ),
                        Text(
                          "О замерах",
                          style: TextStyle(
                            color: currentTab == 2
                                ? Colors.deepPurple
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
                              ? Colors.deepPurple
                              : Colors.white,
                        ),
                        Text(
                          "Что-то",
                          style: TextStyle(
                            color: currentTab == 3
                                ? Colors.deepPurple
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
