import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/counter/counter_bloc.dart';
import '../../bloc/counter/counter_event.dart';
import '../../bloc/counter/counter_state.dart';



class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter BloC & Test FrontEnd "),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state.status == CounterStatus.initial ||
                state.status == CounterStatus.loading) {
              return const CircularProgressIndicator();
            }
            if (state.status == CounterStatus.success) {
              return Text('The counter value is: ${state.counter.value}, ');
            } else {
              return Text('Something went wrong');
            }
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: 'Counter_add',
              onPressed: () {
                context.read<CounterBloc>().add(
                      CounterDecrementPressed(),
                    );
              })
        ],
      ),
    );
  }
}
