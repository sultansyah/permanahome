part of 'permintaan_bloc.dart';

abstract class PermintaanEvent extends Equatable {
  const PermintaanEvent();

  @override
  List<Object> get props => [];
}

class PermintaanEventAdd extends PermintaanEvent {
  final Permintaan permintaan;
  const PermintaanEventAdd(this.permintaan);

  @override
  List<Object> get props => [permintaan];
}
