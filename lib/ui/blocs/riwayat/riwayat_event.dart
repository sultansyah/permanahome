part of 'riwayat_bloc.dart';

abstract class RiwayatEvent extends Equatable {
  const RiwayatEvent();

  @override
  List<Object> get props => [];
}

class RiwayatEventGet extends RiwayatEvent {
  final int permanaHomeNumberId;
  const RiwayatEventGet(this.permanaHomeNumberId);

  @override
  List<Object> get props => [permanaHomeNumberId];
}
