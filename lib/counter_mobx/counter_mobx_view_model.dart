import 'package:mobx/mobx.dart';
part 'counter_mobx_view_model.g.dart';

class CounterMobxViewModel = _CounterMobxViewModelBase with _$CounterMobxViewModel;

abstract class _CounterMobxViewModelBase with Store {
  @observable
  int counter = 0;

  @observable
  bool isIncremented = false;

  @action
  void increment() {
    counter++;
    isIncremented = true;
  }

  @action
  void decrement() {
    counter--;
  }
}
