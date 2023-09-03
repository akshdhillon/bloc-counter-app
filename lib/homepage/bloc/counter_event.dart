part of 'counter_bloc.dart';

sealed class CounterEvent {}

class CounterIncrementEvent extends CounterEvent {
  final int modifier;

  CounterIncrementEvent(this.modifier);
}

class CounterDecrementEvent extends CounterEvent {}
