part of 'permintaan_bloc.dart';

abstract class PermintaanState extends Equatable {
  const PermintaanState();

  @override
  List<Object?> get props => [];
}

class PermintaanInitial extends PermintaanState {}

class PermintaanLoading extends PermintaanState {}

class PermintaanFailed extends PermintaanState {
  final String e;
  const PermintaanFailed(this.e);

  @override
  List<Object> get props => [e];
}

class PermintaanSuccess extends PermintaanState {
  final List<Permintaan?>? permintaan;
  const PermintaanSuccess({this.permintaan});

  @override
  List<Object?> get props => [permintaan];
}
