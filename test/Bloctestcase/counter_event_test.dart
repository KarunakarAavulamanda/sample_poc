import 'package:flutter_test/flutter_test.dart';
import 'package:sample_poc/bloc/counter/counter_event.dart';


void main() {
  group('CounterEvent', () {
    group('Checking the CounterStarted', () {
      test('CounterStarted', () => expect(CounterStarted, CounterStarted));
    });
    group(' Checking CounterIncrementPressed', () {
      test('CounterIncrementPressed',
          () => expect(CounterIncrementPressed, CounterIncrementPressed));
    });
    group(' Checking CounterDecrementPressed', () {
      test('CounterDecrementPressed',
          () => expect(CounterDecrementPressed, CounterDecrementPressed));
    });
  });
}
