part of 'berita_bloc.dart';

abstract class BeritaState extends Equatable {
  const BeritaState();

  @override
  List<Object> get props => [];
}

class BeritaInitial extends BeritaState {}

class BeritaLoading extends BeritaState {}

class BeritaFailed extends BeritaState {
  final String e;
  const BeritaFailed(this.e);

  @override
  List<Object> get props => [e];
}

class BeritaSuccess extends BeritaState {
  final List<BeritaModel> berita;
  const BeritaSuccess(this.berita);

  @override
  List<Object> get props => [berita];
}
