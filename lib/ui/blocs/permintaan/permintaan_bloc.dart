import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permanahome/models/permintaan_model.dart';
import 'package:permanahome/services/permintaan_service.dart';

part 'permintaan_event.dart';
part 'permintaan_state.dart';

class PermintaanBloc extends Bloc<PermintaanEvent, PermintaanState> {
  PermintaanBloc() : super(PermintaanInitial()) {
    on<PermintaanEvent>((event, emit) async {
      if (event is PermintaanEventAdd) {
        try {
          emit(PermintaanLoading());

          await PermintaanService().add(event.permintaan);

          emit(const PermintaanSuccess());
        } catch (e) {
          emit(PermintaanFailed(e.toString()));
        }
      }
    });
  }
}
