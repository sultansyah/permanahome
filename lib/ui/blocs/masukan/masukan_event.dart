part of 'masukan_bloc.dart';

abstract class MasukanEvent extends Equatable {
  const MasukanEvent();

  @override
  List<Object> get props => [];
}

class MasukanEventAdd extends MasukanEvent {
  final Masukan masukan;
  const MasukanEventAdd(this.masukan);

  @override
  List<Object> get props => [masukan];
}
