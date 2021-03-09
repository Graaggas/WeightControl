// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeightMobx on _WeightMobx, Store {
  final _$startWeightAtom = Atom(name: '_WeightMobx.startWeight');

  @override
  double get startWeight {
    _$startWeightAtom.reportRead();
    return super.startWeight;
  }

  @override
  set startWeight(double value) {
    _$startWeightAtom.reportWrite(value, super.startWeight, () {
      super.startWeight = value;
    });
  }

  final _$currentWeightAtom = Atom(name: '_WeightMobx.currentWeight');

  @override
  double get currentWeight {
    _$currentWeightAtom.reportRead();
    return super.currentWeight;
  }

  @override
  set currentWeight(double value) {
    _$currentWeightAtom.reportWrite(value, super.currentWeight, () {
      super.currentWeight = value;
    });
  }

  final _$wantedWeightAtom = Atom(name: '_WeightMobx.wantedWeight');

  @override
  double get wantedWeight {
    _$wantedWeightAtom.reportRead();
    return super.wantedWeight;
  }

  @override
  set wantedWeight(double value) {
    _$wantedWeightAtom.reportWrite(value, super.wantedWeight, () {
      super.wantedWeight = value;
    });
  }

  final _$updateCurrentWeightAsyncAction =
      AsyncAction('_WeightMobx.updateCurrentWeight');

  @override
  Future<void> updateCurrentWeight() {
    return _$updateCurrentWeightAsyncAction
        .run(() => super.updateCurrentWeight());
  }

  final _$getInitAsyncAction = AsyncAction('_WeightMobx.getInit');

  @override
  Future<void> getInit() {
    return _$getInitAsyncAction.run(() => super.getInit());
  }

  final _$_WeightMobxActionController = ActionController(name: '_WeightMobx');

  @override
  void updateStartWeight(double value) {
    final _$actionInfo = _$_WeightMobxActionController.startAction(
        name: '_WeightMobx.updateStartWeight');
    try {
      return super.updateStartWeight(value);
    } finally {
      _$_WeightMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateWantedWeight(double value) {
    final _$actionInfo = _$_WeightMobxActionController.startAction(
        name: '_WeightMobx.updateWantedWeight');
    try {
      return super.updateWantedWeight(value);
    } finally {
      _$_WeightMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
startWeight: ${startWeight},
currentWeight: ${currentWeight},
wantedWeight: ${wantedWeight}
    ''';
  }
}
