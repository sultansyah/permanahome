part of 'paket_layanan_bloc.dart';

abstract class PaketLayananState extends Equatable {
  const PaketLayananState();

  @override
  List<Object> get props => [];
}

class PaketLayananInitial extends PaketLayananState {}

class PaketLayananLoading extends PaketLayananState {}

class PaketLayananDataNotExist extends PaketLayananState {}

class PaketLayananFailed extends PaketLayananState {
  final String e;
  const PaketLayananFailed(this.e);

  @override
  List<Object> get props => [e];
}

class PaketLayananSuccess extends PaketLayananState {
  final List<PaketLayanan> paketLayanan;
  const PaketLayananSuccess(this.paketLayanan);

  @override
  List<Object> get props => [paketLayanan];
}
