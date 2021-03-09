import 'package:mobx/mobx.dart';
import 'package:weight_control/services/database.dart';

part 'adding-page-mobx.g.dart';

class AddingPageMobx = _AddingPageMobx with _$AddingPageMobx;

abstract class _AddingPageMobx with Store {
  final database = HiveDatabase();

  @observable
  bool isWeightChecked = false;

  @observable
  bool isWaisteChecked = false;

  @action
  void changeWeight() {
    print("adding-page-mobx //changeWeight() => isWeightChecked was = $isWeightChecked");
    isWeightChecked = !isWeightChecked;
    print("adding-page-mobx //changeWeight() => isWeightChecked became = $isWeightChecked");
  }

  @action
  void changeWaiste() {
    print("adding-page-mobx //changeWaiste() => isWaisteChecked was = $isWaisteChecked");
    isWaisteChecked = !isWaisteChecked;
    print("adding-page-mobx //changeWaiste() => isWaisteChecked became = $isWaisteChecked");
  }

  @action
  void addWeight(double value) {
    print("adding-page-mobx //addWeight() => value = ${value}");
    database.addToWeightBox(DateTime.now(), value);
  }
}
