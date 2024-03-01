part of 'allah_names_cubit.dart';

sealed class AllahNamesState extends Equatable {
  const AllahNamesState();

  @override
  List<Object> get props => [];
}

final class AllahNamesInitial extends AllahNamesState {}

final class AllahNamesLoading extends AllahNamesState {}

final class AllahNamesFailure extends AllahNamesState {
  final String errMesaage;

  const AllahNamesFailure({required this.errMesaage});
}

final class AllahNamesSuccess extends AllahNamesState {
  final List<AllahNamesModel> dataList;

  const AllahNamesSuccess({required this.dataList});
}
