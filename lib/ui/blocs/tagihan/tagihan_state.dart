part of 'tagihan_bloc.dart';

abstract class TagihanState extends Equatable {
  const TagihanState();

  @override
  List<Object> get props => [];
}

class TagihanInitial extends TagihanState {}

class TagihanLoading extends TagihanState {}

class TagihanSuccess extends TagihanState {
  final Tagihan tagihan;
  const TagihanSuccess(this.tagihan);

  @override
  List<Object> get props => [tagihan];
}

class TagihanFailed extends TagihanState {
  final String e;
  const TagihanFailed(this.e);

  @override
  List<Object> get props => [e];
}
