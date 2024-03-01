import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarCounterCubit extends Cubit<List<int>> {
  AzkarCounterCubit() : super(List<int>.generate(50, (index) => 0));

  void increase(int repeat, int index) {
    if (state.length > index && repeat > state[index]) {
      List<int> newState = List.from(state);
      newState[index] += 1;
      emit(newState);
    }
  }
}
