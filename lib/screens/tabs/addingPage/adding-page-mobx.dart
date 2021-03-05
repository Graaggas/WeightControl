import 'package:mobx/mobx.dart';

part 'adding-page-mobx.g.dart';

class AddingPageMobx = _AddingPageMobx with _$AddingPageMobx;

abstract class _AddingPageMobx with Store {
  @observable
  bool isWeightChecked = false;

  @observable
  bool isWaisteChecked = false;

  @action
  void changeWeight() {

      print("adding-page-mobx // isWeightChecked was = $isWeightChecked");
      isWeightChecked = !isWeightChecked;
      print("adding-page-mobx // isWeightChecked became = $isWeightChecked");

  }

  @action
  void changeWaiste() {

    print("adding-page-mobx // isWaisteChecked was = $isWaisteChecked");
    isWaisteChecked = !isWaisteChecked;
    print("adding-page-mobx // isWaisteChecked became = $isWaisteChecked");

  }
}
