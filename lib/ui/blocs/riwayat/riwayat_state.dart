part of 'riwayat_bloc.dart';

abstract class RiwayatState extends Equatable {
  const RiwayatState();

  @override
  List<Object> get props => [];
}

class RiwayatInitial extends RiwayatState {}

class RiwayatLoading extends RiwayatState {}

class RiwayatFailed extends RiwayatState {
  final String e;
  const RiwayatFailed(this.e);

  @override
  List<Object> get props => [e];
}

class RiwayatSuccess extends RiwayatState {
  final List<Riwayat> riwayat;
  const RiwayatSuccess(this.riwayat);

  @override
  List<Object> get props => [riwayat];
}
