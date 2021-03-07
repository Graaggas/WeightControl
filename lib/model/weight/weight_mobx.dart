import 'package:mobx/mobx.dart';
import 'package:weight_control/services/database.dart';

part 'weight_mobx.g.dart';

class WeightMobx = _WeightMobx with _$WeightMobx;

abstract class _WeightMobx with Store {
  final hiveDatabase = HiveDatabase();

  @observable
  double startWeight;

  @observable
  double currentWeight;

  @observable
  double wantedWeight;

  // @action
  // void addCurrentWeight(double value) {
  //   currentWeight = value;
  // }
  //
  // @action
  // void addStartWeight(double value) {
  //   startWeight = value;
  // }

  // @action
  // void addWantedWeight(double value){
  //   wantedWeight = value;
  // }

  @action
  Future<void> initValues() async {
    final dList = hiveDatabase.getDummyInit();
    List<double> r = await dList;
    print(" future initValues = ok");

    r.forEach((element) {print("el = $element");});

    wantedWeight = r[0];
    startWeight = r[1];
    currentWeight = r[2];

    print("wanted = $wantedWeight");
    print("start = $startWeight");
    print("current = $currentWeight");

  }
}
