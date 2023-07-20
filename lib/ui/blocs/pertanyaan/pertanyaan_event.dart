part of 'pertanyaan_bloc.dart';

abstract class PertanyaanEvent extends Equatable {
  const PertanyaanEvent();

  @override
  List<Object> get props => [];
}

class PertanyaanEventGet extends PertanyaanEvent {}
