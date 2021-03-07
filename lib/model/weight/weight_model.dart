import 'package:hive/hive.dart';

part 'weight_model.g.dart';

@HiveType(typeId: 1)
class WeightModel {
  @HiveField(1)
  List<double> _weightList = new List<double>();
  
  @HiveField(2)
  double _wantedWeight;
  
  @HiveField(3)
  String _name;

  void addToWeightList(double value) {
    print ("weight_model // adding to List = $value");
    _weightList.add(value);
  }

  List<double> get getValuesList {
    List<double> returnedListWithWantedWeight = new List<double>();

    //first add wanted
    returnedListWithWantedWeight.add(_wantedWeight);
    //then add another values of start and current
    _weightList.forEach((element) => returnedListWithWantedWeight.add(element));
    return returnedListWithWantedWeight;

  }
  void addWantedWeight(double value) {
    _wantedWeight = value;
    print ("weight_model // wantedWeight = $_wantedWeight");
  }
}
