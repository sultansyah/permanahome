part of 'formulir_instalasi_bloc.dart';

abstract class FormulirInstalasiEvent extends Equatable {
  const FormulirInstalasiEvent();

  @override
  List<Object> get props => [];
}

class FormulirInstalasiAdd extends FormulirInstalasiEvent {
  final FormulirInstalasi formulirInstalasi;
  const FormulirInstalasiAdd(this.formulirInstalasi);

  @override
  List<Object> get props => [formulirInstalasi];
}
