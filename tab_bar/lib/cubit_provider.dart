import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  SharedPreferences? sharedPreferences;
  int value = 0;

  void increment() async{
    value = value + 1;
    await saveDataFromLocal();
    emit(value);
  }

  void decrement() async{
    if(value > 0){
      value = value - 1;
      await saveDataFromLocal();
      emit(value);
    }
  }

  Future saveDataFromLocal() async{
    if(sharedPreferences == null){
      sharedPreferences = await SharedPreferences.getInstance();
    }
    int data = value;
    await sharedPreferences!.setInt('value', data);
  }

  void getDataFromLocal() async{
    if(sharedPreferences == null){
      sharedPreferences = await SharedPreferences.getInstance();
    }
    value = sharedPreferences!.getInt('value')!;
    emit(value);
  }

}
