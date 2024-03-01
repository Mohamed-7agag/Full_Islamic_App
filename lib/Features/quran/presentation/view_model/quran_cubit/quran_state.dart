part of 'quran_cubit.dart';

sealed class QuranState extends Equatable {
  const QuranState();

  @override
  List<Object> get props => [];
}

final class QuranInitial extends QuranState {}

final class QuranLoading extends QuranState {}

final class QuranFailure extends QuranState {
  final String errMessage;

  const QuranFailure({required this.errMessage});
}

final class QuranSuccess extends QuranState {
  final List<QuranModel> quran;

  const QuranSuccess({required this.quran});
}
