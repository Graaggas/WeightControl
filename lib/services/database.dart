import 'package:hive/hive.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:weight_control/model/weight/weight_model.dart';

class HiveDatabase {
  Future<Box> openBox(String name) async {
    var box = await Hive.openBox(name);
    return box;
  }

  Future<void> addToBox(WeightModel weightModel, Box box1) async {
    final box = await openBox(box1.name);
    box.add(weightModel);
  }

  Future<List<double>> getDummyInit() async{

    final List<double> dList = [90, 151, 129];
    return dList;

  }
}