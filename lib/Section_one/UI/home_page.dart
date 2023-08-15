import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';
import '../bloc/counter_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if(state is ChangeStateTheCounter){
                  return Text(
                     state.counter.toString()
                  , style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25));
                }else {
                  return Text(
                      '0'                      , style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25));

                }
              },
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {
BlocProvider.of<CounterBloc>(context).add(IncrementCounterEvent());
                }, child: Text('+')),
                const SizedBox(
                  width: 7,
                ),
                ElevatedButton(onPressed: () {
                  BlocProvider.of<CounterBloc>(context).add(RestCounterEvent());
                }, child: Text('0')),
                const SizedBox(
                  width: 7,
                ),
                ElevatedButton(onPressed: () {
                  BlocProvider.of<CounterBloc>(context).add(DecrementCounterEvent());
                }, child: Text('-')),
                const SizedBox(
                  width: 7,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
