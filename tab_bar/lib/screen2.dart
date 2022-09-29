import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tab_bar/cubit_provider.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {

  bool _isFirstTime = true;

  @override
  Widget build(BuildContext context) {
    if(_isFirstTime){
      if(context.read<CounterCubit>().sharedPreferences == null){
        context.read<CounterCubit>().getDataFromLocal();
      }
    }
    return Scaffold(
      body: Center(
        widthFactor: double.infinity,
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, cnt) => Text(
              '${context.read<CounterCubit>().value}',
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
            ),
          ),
        ),
      );
  }
}
