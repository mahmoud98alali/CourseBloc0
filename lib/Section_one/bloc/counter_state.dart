

abstract class CounterState {}

class CounterInitial extends CounterState {}

class ChangeStateTheCounter extends CounterState{
 final int counter;
  ChangeStateTheCounter({
    required this.counter,
});
}