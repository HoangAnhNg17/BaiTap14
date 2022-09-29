import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tab_bar/cubit_provider.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                context.read<CounterCubit>().increment();
              },
              child: Icon(Icons.add),
            ),
            SizedBox(width: 33,),
            FloatingActionButton(
              onPressed: () {
                context.read<CounterCubit>().decrement();
              },
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
