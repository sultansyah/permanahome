part of 'notifikasi_bloc.dart';

abstract class NotifikasiEvent extends Equatable {
  const NotifikasiEvent();

  @override
  List<Object?> get props => [];
}

class NotifikasiEventGet extends NotifikasiEvent {
  final String? permanaHomeNumberId;
  const NotifikasiEventGet({this.permanaHomeNumberId});

  @override
  List<Object?> get props => [permanaHomeNumberId];
}
