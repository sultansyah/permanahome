import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permanahome/models/paket_layanan_model.dart';
import 'package:permanahome/services/paket_layanan_service.dart';

part 'paket_layanan_event.dart';
part 'paket_layanan_state.dart';

class PaketLayananBloc extends Bloc<PaketLayananEvent, PaketLayananState> {
  PaketLayananBloc() : super(PaketLayananInitial()) {
    on<PaketLayananEvent>((event, emit) async {
      if (event is PaketLayananGet) {
        try {
          emit(PaketLayananLoading());

          final List<PaketLayanan> paketLayanan =
              await PaketLayananService().getAllByArea('Medan');

          if (paketLayanan.isEmpty == true) {
            emit(PaketLayananDataNotExist());
          } else {
            emit(PaketLayananSuccess(paketLayanan));
          }
        } catch (e) {
          emit(PaketLayananFailed(e.toString()));
        }
      }
    });
  }
}
