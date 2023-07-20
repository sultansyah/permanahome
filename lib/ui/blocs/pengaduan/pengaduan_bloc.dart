import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permanahome/models/pengaduan_model.dart';
import 'package:permanahome/services/pengaduan_service.dart';

part 'pengaduan_event.dart';
part 'pengaduan_state.dart';

class PengaduanBloc extends Bloc<PengaduanEvent, PengaduanState> {
  PengaduanBloc() : super(PengaduanInitial()) {
    on<PengaduanEvent>((event, emit) async {
      if (event is PengaduanEventAdd) {
        try {
          emit(PengaduanLoading());

          await PengaduanService().add(event.pengaduan);

          emit(PengaduanSuccess());
        } catch (e) {
          emit(PengaduanFailed(e.toString()));
        }
      }
    });
  }
}
