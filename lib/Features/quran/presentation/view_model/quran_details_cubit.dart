import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/local_data.dart';

class ActionCubit extends Cubit<bool> {
  ActionCubit() : super(false);

  void toggleAction() {
    emit(!state);
  }
}

class ChangeNumberCubit extends Cubit<int> {
  ChangeNumberCubit({required int number}) : super(number);

  void change(int number) {
    emit(number);
  }
}

class ChangeJuzCubit extends Cubit<int> {
  ChangeJuzCubit({required int number}) : super(number);
  void changeJuzName(int target) {
    int index = juz.indexWhere((element) => element[1] > target);
    if (index == -1) {
      emit(0);
    }
    emit(index);
  }
}

class MarkCubit extends Cubit<bool> {
  MarkCubit() : super(false);

  void changeMark() {
    emit(!state);
  }
}
