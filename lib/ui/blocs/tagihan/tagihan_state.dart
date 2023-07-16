part of 'tagihan_bloc.dart';

abstract class TagihanState extends Equatable {
  const TagihanState();

  @override
  List<Object> get props => [];
}

class TagihanInitial extends TagihanState {}

class TagihanLoading extends TagihanState {}

class TagihanSuccess extends TagihanState {}

class TagihanFailed extends TagihanState {}
