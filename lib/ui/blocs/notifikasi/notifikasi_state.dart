part of 'notifikasi_bloc.dart';

abstract class NotifikasiState extends Equatable {
  const NotifikasiState();

  @override
  List<Object> get props => [];
}

class NotifikasiInitial extends NotifikasiState {}

class NotifikasiLoading extends NotifikasiState {}

class NotifikasiFailed extends NotifikasiState {
  final String e;
  const NotifikasiFailed(this.e);

  @override
  List<Object> get props => [e];
}

class NotifikasiSuccess extends NotifikasiState {
  final List<Notifikasi> notifikasi;
  const NotifikasiSuccess(this.notifikasi);

  @override
  List<Object> get props => [notifikasi];
}
