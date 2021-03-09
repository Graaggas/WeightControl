import 'package:hive/hive.dart';
import 'package:weight_control/model/weight/weight_model.dart';

class HiveDatabase {
  Future<Box> openBox(String name) async {
    var box = await Hive.openBox(name);
    return box;
  }

  void testBox(Box box, String path) {
    for (int i = 0; i < box.length; i++) {
      print("//database TESTBOX $path => box length = ${box.length}");
      print("//database TESTBOX $path => index = $i");

      for (var key in box.keys) {
        print("//database TESTBOX $path => box keys:: $key");
      }

      WeightModel weightModel = box.getAt(i);

      for (var item in weightModel.weights.entries) {
        print("//database TESTBOX $path => box contains: $item");
      }
    }
  }

  Future<double> getCurrentWeight() async {
    var box = await openBox("Weight");
    var weightModel = WeightModel();
    weightModel = box.get(0);
    double res = 0;
    res = weightModel.lastCurrentWeight();
    print("getCurrentWeight = $res");
    return res;
  }

  Future<void> createBoxWeight(
      DateTime dateTime, double valueCurrentWeight, double wantedWeight) async {
    var weightModel = WeightModel();
    var box = await openBox("Weight");
    weightModel.addWantedWeight(wantedWeight);
    weightModel.addWeight(dateTime, valueCurrentWeight);

    print(
        "//database//createBoxWeight() => dateTime=$dateTime, value = $valueCurrentWeight, wantedWeight = $wantedWeight");

    box.add(weightModel);

    // testBox(box, "//createBoxWeight");
  }

  Future<void> addToWeightBox(DateTime dateTime, double value) async {
    final box = await openBox("Weight");
    var weightModel = WeightModel();

    if (box.isNotEmpty) {
      print("//database//AddToWeightBox() => box.isNotEmpty => ...");

      weightModel = box.getAt(0);
      weightModel.addWantedWeight(10);
      weightModel.addWeight(dateTime, value);
      weightModel.save();
    } else {
      print("//database//AddToWeightBox() => box.isEmpty => ...");
      createBoxWeight(dateTime, value, 11);
    }

    // WeightModel weightModel = new WeightModel();
    // if (box.isNotEmpty) {
    //   weightModel = box.getAt(1);
    //   print(
    //       "//database//addToWeightBox() => *box.isNotEmpty* wantedWeight = ${weightModel.wantedWeight}");
    //   for (var item in weightModel.weights.entries) {
    //     print(
    //         "//database//addToWeightBox() => *box.isNotEmpty* currentWeight = $item");
    //   }
    //   print(
    //       "//database//addToWeightBox() => *box.isNotEmpty* add new currentWeight = $value");
    //   weightModel.addWeight(dateTime, value);
    // } else {
    //   print(
    //       "//database//addToWeightBox() => *box.isEmpty* add new currentWeight = $value");
    //   weightModel.addWeight(dateTime, value);
    // }
    //
    // box.put(1, weightModel);
  }

  Future<List<double>> getInit() async {
    print("//database//getInit => initialization ...");
    final box = await openBox("Weight");
    List<double> list = [];

    /// Check box, if it exists and not empty
    if (box.isNotEmpty) {
      // testBox(box, "//getInit");

      WeightModel weightModel = box.get(0);

      /// Add wantedWeight
      list.add(weightModel.wantedWeight);
      print("//database//getInit() => isNotEmpty => wanted = ${list[0]}");

      /// Add map's entries to the list
      for (var item in weightModel.weights.entries) {
        list.add(item.value);
        print("//database//getInit() => isNotEmpty => added = ${item.value}");
      }
      return list;
    } else {
      print("//database//getInit =>  first start... ");
      list.add(0);
      list.add(0);
      print("//database//getInit() => wantedWeight = ${list[0]}");
      print("//database//getInit() => currentWeight = ${list[1]}");
      return list;
    }
  }
}
