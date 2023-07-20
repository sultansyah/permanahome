part of 'pengaduan_bloc.dart';

abstract class PengaduanEvent extends Equatable {
  const PengaduanEvent();

  @override
  List<Object> get props => [];
}

class PengaduanEventAdd extends PengaduanEvent {
  final Pengaduan pengaduan;
  const PengaduanEventAdd(this.pengaduan);

  @override
  List<Object> get props => [pengaduan];
}
