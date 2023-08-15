import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0 ;
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
     if(event is IncrementCounterEvent){
       counter = counter + 1;
       emit(ChangeStateTheCounter(counter: counter));
     }else if(event is DecrementCounterEvent){
       counter = counter - 1;
       emit(ChangeStateTheCounter(counter: counter));
     }

    else{
       counter = 0 ;
       emit(ChangeStateTheCounter(counter: counter));
     }
    });
  }
}
