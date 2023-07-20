part of 'pengaduan_bloc.dart';

abstract class PengaduanState extends Equatable {
  const PengaduanState();

  @override
  List<Object> get props => [];
}

class PengaduanInitial extends PengaduanState {}

class PengaduanLoading extends PengaduanState {}

class PengaduanFailed extends PengaduanState {
  final String e;
  const PengaduanFailed(this.e);

  @override
  List<Object> get props => [e];
}

class PengaduanSuccess extends PengaduanState {}
