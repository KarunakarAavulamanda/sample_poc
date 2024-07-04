import 'package:bloc/bloc.dart';
import 'package:sample_poc/bloc/counter/counter_event.dart';
import 'package:sample_poc/bloc/counter/counter_state.dart';

import '../../model/counter_model/models.dart';




class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterStarted>(_onStarted);
    on<CounterIncrementPressed>(_onIncrementPressed);
    on<CounterDecrementPressed>(_onDecrementPressed);
  }

  void _onStarted(
    CounterStarted event,
    Emitter<CounterState> emit,
  ) {
    if (state.status == CounterStatus.success) return;
    Counter counter = const Counter();
    emit(CounterState(
      counter: counter,
      status: CounterStatus.success,
    ));
  }

  void _onIncrementPressed(
    CounterIncrementPressed event,
    Emitter<CounterState> emit,
  ) {
    int value = state.counter.value + 1;
    Counter counter = state.counter.copyWith(value: value);
    emit(state.copyWith(counter: counter, status: CounterStatus.success));
  }

  void _onDecrementPressed(
    CounterDecrementPressed event,
    Emitter<CounterState> emit,
  ) {
    int value = state.counter.value - 1;
    Counter counter = state.counter.copyWith(value: value);
    emit(state.copyWith(counter: counter, status: CounterStatus.success));
  }
}
