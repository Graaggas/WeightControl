import 'package:mobx/mobx.dart';

part 'weight_mobx.g.dart';

class WeightMobx = _WeightMobx with _$WeightMobx;

abstract class _WeightMobx with Store{
  @observable
  double startWeight = 10.0;

  @observable
  double currentWeight = 30.0;

  @observable
  double wantedWeight = 40;

  @action
  void addCurrentWeight(double value) {
    currentWeight = value;
  }

  @action
  void addStartWeight(double value) {
    startWeight = value;
  }

  @action
  void addWantedWeight(double value){
    wantedWeight = value;
  }


}