part of 'pertanyaan_bloc.dart';

abstract class PertanyaanState extends Equatable {
  const PertanyaanState();

  @override
  List<Object> get props => [];
}

class PertanyaanInitial extends PertanyaanState {}

class PertanyaanLoading extends PertanyaanState {}

class PertanyaanFailed extends PertanyaanState {
  final String e;
  const PertanyaanFailed(this.e);

  @override
  List<Object> get props => [e];
}

class PertanyaanSuccess extends PertanyaanState {
  final List<Pertanyaan> pertanyaan;
  const PertanyaanSuccess(this.pertanyaan);

  @override
  List<Object> get props => [pertanyaan];
}
