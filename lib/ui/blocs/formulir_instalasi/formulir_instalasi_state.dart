part of 'formulir_instalasi_bloc.dart';

abstract class FormulirInstalasiState extends Equatable {
  const FormulirInstalasiState();

  @override
  List<Object> get props => [];
}

class FormulirInstalasiInitial extends FormulirInstalasiState {}

class FormulirInstalasiLoading extends FormulirInstalasiState {}

class FormulirInstalasiFailed extends FormulirInstalasiState {
  final String e;
  const FormulirInstalasiFailed(this.e);

  @override
  List<Object> get props => [e];
}

class FormulirInstalasiSuccess extends FormulirInstalasiState {}
