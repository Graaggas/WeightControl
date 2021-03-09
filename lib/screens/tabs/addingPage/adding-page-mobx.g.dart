// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adding-page-mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddingPageMobx on _AddingPageMobx, Store {
  final _$isWeightCheckedAtom = Atom(name: '_AddingPageMobx.isWeightChecked');

  @override
  bool get isWeightChecked {
    _$isWeightCheckedAtom.reportRead();
    return super.isWeightChecked;
  }

  @override
  set isWeightChecked(bool value) {
    _$isWeightCheckedAtom.reportWrite(value, super.isWeightChecked, () {
      super.isWeightChecked = value;
    });
  }

  final _$isWaisteCheckedAtom = Atom(name: '_AddingPageMobx.isWaisteChecked');

  @override
  bool get isWaisteChecked {
    _$isWaisteCheckedAtom.reportRead();
    return super.isWaisteChecked;
  }

  @override
  set isWaisteChecked(bool value) {
    _$isWaisteCheckedAtom.reportWrite(value, super.isWaisteChecked, () {
      super.isWaisteChecked = value;
    });
  }

  final _$_AddingPageMobxActionController =
      ActionController(name: '_AddingPageMobx');

  @override
  void changeWeight() {
    final _$actionInfo = _$_AddingPageMobxActionController.startAction(
        name: '_AddingPageMobx.changeWeight');
    try {
      return super.changeWeight();
    } finally {
      _$_AddingPageMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeWaiste() {
    final _$actionInfo = _$_AddingPageMobxActionController.startAction(
        name: '_AddingPageMobx.changeWaiste');
    try {
      return super.changeWaiste();
    } finally {
      _$_AddingPageMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addWeight(double value) {
    final _$actionInfo = _$_AddingPageMobxActionController.startAction(
        name: '_AddingPageMobx.addWeight');
    try {
      return super.addWeight(value);
    } finally {
      _$_AddingPageMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isWeightChecked: ${isWeightChecked},
isWaisteChecked: ${isWaisteChecked}
    ''';
  }
}
