part of 'prayer_cubit.dart';

sealed class PrayerState extends Equatable {
  const PrayerState();

  @override
  List<Object> get props => [];
}

final class PrayerInitial extends PrayerState {}

final class PrayerLoading extends PrayerState {}

final class PrayerFailure extends PrayerState {
  final String errMessage;

  const PrayerFailure({required this.errMessage});
}

final class PrayerSuccess extends PrayerState {
  final List<PrayerModel> prayerModelList;

  const PrayerSuccess({required this.prayerModelList});
}
