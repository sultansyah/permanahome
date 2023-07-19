import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permanahome/models/formulir_instalasi_model.dart';
import 'package:permanahome/services/formulir_instalasi_service.dart';

part 'formulir_instalasi_event.dart';
part 'formulir_instalasi_state.dart';

class FormulirInstalasiBloc
    extends Bloc<FormulirInstalasiEvent, FormulirInstalasiState> {
  FormulirInstalasiBloc() : super(FormulirInstalasiInitial()) {
    on<FormulirInstalasiEvent>((event, emit) async {
      if (event is FormulirInstalasiAdd) {
        try {
          emit(FormulirInstalasiLoading());

          await FormulirInstalasiService().add(event.formulirInstalasi);

          emit(FormulirInstalasiSuccess());
        } catch (e) {
          emit(FormulirInstalasiFailed(e.toString()));
        }
      }
    });
  }
}
