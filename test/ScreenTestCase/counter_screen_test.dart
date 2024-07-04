import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_poc/bloc/counter/counter_bloc.dart';
import 'package:sample_poc/ui/counter_screen/counter_screen.dart';



// void main() {
//   testWidgets('checking the counter app', (WidgetTester tester) => );
// }

// void main() {
//   testWidgets('CounterPage displays initial state', (WidgetTester tester) async  {
//     when(counterBloc.state).thenReturn(0); // Mock initial state

//     await tester.pumpWidget(
//       BlocProvider.value(
//         value: counterBloc,
//         child: MaterialApp(
//           home: CounterPage(),
//         ),
//       ),
//     );

//     expect(find.text('Counter Value:'), findsOneWidget);
//     expect(find.text('0'), findsOneWidget);
//   });
// }

// void main() {
//   testWidgets('Checking the counter app ui', (WidgetTester tester) async {
//     // find all widgets needed

//     // final textField = find.byKey(const ValueKey('Counter BloC & Test'));
//     final addButton = find.byKey(const ValueKey('Counter_add'));

//     //execute the actual test

//     await tester.pumpWidget(MaterialApp(home: CounterScreen()));
//     await tester.tap(addButton);
//     await tester.pump(); // rebuilds your widget

//     // check outputs

//     expect(find.text("from button"), findsOneWidget);
//   });
// }

void main() {
  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets("checking test", (widgetTester) async {
    await widgetTester.pumpWidget(_makeTestableWidget(const CounterScreen()));

    expect(find.text("Counter BloC & Test"), findsOneWidget);
  });

  testWidgets("checking button", (widgetTester) async {
    await widgetTester.pumpWidget(_makeTestableWidget(const CounterScreen()));

    var fab = find.byType(FloatingActionButton);
    FloatingActionButton fabWidget = widgetTester.widget(fab);
    expect(fabWidget.heroTag, equals('Counter_add'));
  });

  testWidgets("text", (widgetTester) async {
    await widgetTester.pumpWidget(_makeTestableWidget(const CounterScreen()));

    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('test', (widgetTester) async {
    //act``
    await widgetTester.pumpWidget(_makeTestableWidget(const CounterScreen()));

    //assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
