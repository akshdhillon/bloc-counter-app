part of 'counter_bloc.dart';

sealed class CounterState {
  final int count;

  CounterState(this.count);

  String get counter => count.toString();
}

class CounterInitialState extends CounterState {
  CounterInitialState(super.count);
}

class CounterSuccessState extends CounterState {
  CounterSuccessState(super.count);
}

class CounterErrorState extends CounterState {
  final String _message;

  CounterErrorState(super.count, this._message);

  String get message => '$_message $counter is enough';
}

class CounterThatsItState extends CounterState {
  CounterThatsItState(super.count) ;
}
