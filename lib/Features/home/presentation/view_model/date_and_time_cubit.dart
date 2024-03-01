import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateTimeCubit extends Cubit<DateTime> {
  late Timer _timer;

  DateTimeCubit() : super(DateTime.now()) {
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      emit(DateTime.now());
    });
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
