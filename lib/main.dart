import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:weight_control/model/weight/weight_mobx.dart';
import 'package:weight_control/model/weight/weight_model.dart';

import 'package:weight_control/screens/home_page.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(WeightModelAdapter());
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<WeightMobx>.value(value: WeightMobx()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: HomePage(),
      ),
    );
  }
}
