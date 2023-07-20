part of 'masukan_bloc.dart';

abstract class MasukanState extends Equatable {
  const MasukanState();

  @override
  List<Object> get props => [];
}

class MasukanInitial extends MasukanState {}

class MasukanLoading extends MasukanState {}

class MasukanFailed extends MasukanState {
  final String e;
  const MasukanFailed(this.e);

  @override
  List<Object> get props => [e];
}

class MasukanSuccess extends MasukanState {}
