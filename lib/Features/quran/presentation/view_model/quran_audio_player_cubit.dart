import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audioplayers/audioplayers.dart';

enum AudioPlayerStatus {
  stopped,
  playing,
  paused,
  seekBackward,
  seekForward,
  seek,
}

class AudioPlayerCubit extends Cubit<AudioPlayerStatus> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = const Duration();
  Duration position = const Duration();

  AudioPlayerCubit() : super(AudioPlayerStatus.stopped) {
    audioPlayer.onDurationChanged.listen((updatedDuration) {
      duration = updatedDuration;
      emit(AudioPlayerStatus.playing);
    });
    audioPlayer.onPositionChanged.listen((updatedPosition) {
      position = updatedPosition;
      emit(AudioPlayerStatus.playing);
    });
  }

  Future<void> play({required String url}) async {
    await audioPlayer.play(UrlSource(url));
    emit(AudioPlayerStatus.playing);
  }

  Future<void> pause() async {
    await audioPlayer.pause();
    emit(AudioPlayerStatus.paused);
  }

  Future<void> stop() async {
    await audioPlayer.stop();
    emit(AudioPlayerStatus.stopped);
  }

  void seekForward() async {
    int newPosition = position.inSeconds + 10;
    await audioPlayer.seek(Duration(seconds: newPosition));
    emit(AudioPlayerStatus.seekForward);

  }

  void seekBackword() async {
    int newPosition = position.inSeconds - 10;
    await audioPlayer.seek(Duration(seconds: newPosition));
    emit(AudioPlayerStatus.seekBackward);
  }

  void seeked(Duration duration) async {
    await audioPlayer.seek(duration);
    emit(AudioPlayerStatus.seek);
  }
}

// to get current postion of audio
class AudioPlayerPositionCubit extends Cubit<Duration> {
  AudioPlayerPositionCubit() : super(const Duration(seconds: 0));
  void currentPosition(AudioPlayer audioPlayer) {
    audioPlayer.onPositionChanged.listen((updatedPosition) {
      emit(updatedPosition);
    });
  }
}
