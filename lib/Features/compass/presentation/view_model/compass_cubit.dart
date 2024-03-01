import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_compass/flutter_compass.dart';

class CompassCubit extends Cubit<double> {
  CompassCubit() : super(0.0) {
    _initCompass();
  }

  void _initCompass() {
    FlutterCompass.events!.listen((event) {
      if (!isClosed) {
        emit(event.heading!);
      }
    });
  }

  @override
  Future<void> close() {
    FlutterCompass.events!.listen((event) {}).cancel();
    return super.close();
  }
}
