import 'package:mobx/mobx.dart';

part 'counter_store.g.dart';

class CounterStore = Counter with _$CounterStore;

abstract class Counter with Store {
  @observable
  int counter = 0;

  @action
  void increment() {
    counter++;
  }
}
