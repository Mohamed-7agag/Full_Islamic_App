import 'package:flutter_bloc/flutter_bloc.dart';

class SibhaCubit extends Cubit<List<int>> {
  SibhaCubit() : super([0, 0, 0]);

  void increment() {
    state[0] += 1;
    state[2] += 1;
    if (state[0] == 33) {
      state[1] += 1;
      state[0] = 0;
    }
    emit([state[0], state[1], state[2]]);
  }

  void reset() {
    emit([0, 0, 0]);
  }

  void resetCounter() {
    state[0] = 0;
    emit([state[0], state[1], state[2]]);
  }
}

class SibhaTextCubit extends Cubit<String> {
  SibhaTextCubit() : super("أذكر الله");

  void setText(String text) => emit(text);
}
