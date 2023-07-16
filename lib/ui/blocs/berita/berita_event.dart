part of 'berita_bloc.dart';

abstract class BeritaEvent extends Equatable {
  const BeritaEvent();

  @override
  List<Object> get props => [];
}

class BeritaGet extends BeritaEvent {}
