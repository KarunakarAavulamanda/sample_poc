import 'package:flutter_test/flutter_test.dart';
import 'package:sample_poc/bloc/counter/counter_state.dart';
import 'package:sample_poc/model/counter_model/models.dart';


void main() {
  //Main group inside this we have subgroups for testing
  group('', () {
    //Create instance for Counter model

    var testCounter = const Counter();

    // creating the subgroup where we collect the all the test for the counterstate where the status equal to initial

    group('CounterState, initial', () {
      const testStatus = CounterStatus.initial;

      //creating method which use to create new instance of CounterState

      CounterState createSubject() {
        // returning the new instance of counter state
        return CounterState(counter: testCounter, status: testStatus);
      }

      // cretaing first test case ,

      test("support value equality", () {
        expect(createSubject, equals(createSubject));
      });

      test(
          'support value equality',
          () => expect(
              createSubject(), equals(<Object?>[testCounter, testStatus])));
      test(
          'returns object with updated status',
          () => expect(
              createSubject().copyWith(status: CounterStatus.success),
              CounterState(
                  counter: testCounter, status: CounterStatus.success)));
    });
  });
}
