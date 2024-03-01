part of 'quran_audio_cubit.dart';

sealed class QuranAudioState extends Equatable {
  const QuranAudioState();

  @override
  List<Object> get props => [];
}

final class QuranAudioInitial extends QuranAudioState {}

final class QuranAudioLoading extends QuranAudioState {}

final class QuranAudioFailure extends QuranAudioState {
  final String errMessage;

  const QuranAudioFailure({required this.errMessage});
}

final class QuranAudioSuccess extends QuranAudioState {
  final List<QuranAudioModel> list;

  const QuranAudioSuccess({required this.list});
}
