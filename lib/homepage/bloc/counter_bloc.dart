import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  final int diValue;

  CounterBloc(this.diValue) : super(CounterInitialState(diValue)) {
    counter = diValue;

    on<CounterIncrementEvent>(onIncrementEvent);

    on<CounterDecrementEvent>(
      (event, emit) => emit(CounterSuccessState(--counter)),
    );
  }

  FutureOr<void> onIncrementEvent(
    CounterIncrementEvent event,
    Emitter<CounterState> emit,
  ) {
    if (counter == 20) {
      emit(CounterThatsItState(counter));
    } else if (counter >= 15) {
      emit(CounterErrorState(++counter, 'Stop!'));
    } else {
      emit(CounterSuccessState((++counter) * event.modifier));
    }
  }
}
