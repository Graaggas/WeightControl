import 'package:mobx/mobx.dart';
import 'package:weight_control/services/database.dart';

part 'weight_mobx.g.dart';

class WeightMobx = _WeightMobx with _$WeightMobx;

abstract class _WeightMobx with Store {
  final hiveDatabase = HiveDatabase();

  @observable
  double startWeight = 0.0;

  @observable
  double currentWeight = 0.0;

  @observable
  double wantedWeight = 0.0;

  @action
  void updateStartWeight(double value) {
    print("weight_mobx // startWeight = $startWeight");
    startWeight = value;
  }

  @action
  Future<void> updateCurrentWeight() async {
    print("try to getCurrent in weight_mobx...");
    // currentWeight = value;
    final future = await hiveDatabase.getCurrentWeight();
    currentWeight = future;
    print("currentWeight = $currentWeight");
  }

  @action
  void updateWantedWeight(double value) {
    wantedWeight = value;
  }

  @action
  Future<void> getInit() async {
    final future = await hiveDatabase.getInit();
    wantedWeight = future[0];
    startWeight = future[1];
    currentWeight = future[future.length - 1];
  }
}
