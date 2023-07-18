part of 'paket_layanan_bloc.dart';

abstract class PaketLayananEvent extends Equatable {
  const PaketLayananEvent();

  @override
  List<Object> get props => [];
}

class PaketLayananGet extends PaketLayananEvent {
  final String area;
  const PaketLayananGet(this.area);

  @override
  List<Object> get props => [area];
}
