import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Section_one/UI/home_page.dart';
import 'Section_one/bloc/counter_bloc.dart';

void main() {
  runApp(MyAppBloc());
}


class MyAppBloc extends StatelessWidget {
  const MyAppBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter with Bloc",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,),
        home: HomePage(),
      ),
    );
  }
}
