// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_mobx_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CounterMobxViewModel on _CounterMobxViewModelBase, Store {
  final _$counterAtom = Atom(name: '_CounterMobxViewModelBase.counter');

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  final _$isIncrementedAtom =
      Atom(name: '_CounterMobxViewModelBase.isIncremented');

  @override
  bool get isIncremented {
    _$isIncrementedAtom.reportRead();
    return super.isIncremented;
  }

  @override
  set isIncremented(bool value) {
    _$isIncrementedAtom.reportWrite(value, super.isIncremented, () {
      super.isIncremented = value;
    });
  }

  final _$_CounterMobxViewModelBaseActionController =
      ActionController(name: '_CounterMobxViewModelBase');

  @override
  void increment() {
    final _$actionInfo = _$_CounterMobxViewModelBaseActionController
        .startAction(name: '_CounterMobxViewModelBase.increment');
    try {
      return super.increment();
    } finally {
      _$_CounterMobxViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_CounterMobxViewModelBaseActionController
        .startAction(name: '_CounterMobxViewModelBase.decrement');
    try {
      return super.decrement();
    } finally {
      _$_CounterMobxViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counter: ${counter},
isIncremented: ${isIncremented}
    ''';
  }
}
