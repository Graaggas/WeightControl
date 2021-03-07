import 'package:hive/hive.dart';

part 'weight_model.g.dart';

@HiveType(typeId: 1)
class WeightModel {
  @HiveField(1)
  List<double> weightList;
  
  @HiveField(2)
  double wantedWeight;
  
  @HiveField(3)
  String name;
}
