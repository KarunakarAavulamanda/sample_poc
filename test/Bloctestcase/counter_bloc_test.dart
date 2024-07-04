import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_poc/bloc/counter/counter_bloc.dart';
import 'package:sample_poc/bloc/counter/counter_event.dart';
import 'package:sample_poc/bloc/counter/counter_state.dart';
import 'package:sample_poc/model/counter_model/models.dart';


void main() {
  group('CounterBloc', () {
    const mockCounter = Counter();

//in setup function will register all the function we need to run befor the test
    setUp(() => {
          //  initialize all the dependencies for the blcoker
        });

    CounterBloc buidBloc() {
      return CounterBloc();
    }

    group('constructor', () {
      // returnNormally will check is there any exception , when this method invoke
      test('works properly', () => expect(buidBloc, returnsNormally));
    });
    test('has correct initial state',
        () => expect(buidBloc().state, equals(const CounterState())));
    group('CounterStarted', () {
      blocTest(
        'emits [success] when is loaded successfully',
        // build should construct and bild the bloc
        build: () => CounterBloc(),
        // act is an optional callback
        act: (bloc) => bloc.add(CounterStarted()),
        expect: () => //emiting the new counterState
            {
          const CounterState(
              counter: mockCounter, status: CounterStatus.success)
        },
      );
    });
    group('CounterIncrementPressed', () {
      blocTest(
        'emits [counterstate] when users tap the button',
        build: () => CounterBloc(),
        act: (bloc) => bloc.add(CounterIncrementPressed()),
        expect: () => [
          const CounterState(
              counter: Counter(value: 1), status: CounterStatus.success)
        ],
      );
    });
  });
  group("CounterDrecementPressed", () {
    blocTest(
      "emits [success] when user press the decrease button",
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(CounterDecrementPressed()),
      expect: () => [
        const CounterState(
            counter: Counter(value: -1), status: CounterStatus.success)
      ],
    );
  });
}
