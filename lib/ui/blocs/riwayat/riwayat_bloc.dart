import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permanahome/models/riwayat_model.dart';
import 'package:permanahome/services/riwayat_service.dart';

part 'riwayat_event.dart';
part 'riwayat_state.dart';

class RiwayatBloc extends Bloc<RiwayatEvent, RiwayatState> {
  RiwayatBloc() : super(RiwayatInitial()) {
    on<RiwayatEvent>((event, emit) async {
      if (event is RiwayatEventGet) {
        try {
          emit(RiwayatLoading());

          final List<Riwayat> riwayat =
              await RiwayatService().gets(event.permanaHomeNumberId);

          emit(RiwayatSuccess(riwayat));
        } catch (e) {
          emit(RiwayatFailed(e.toString()));
        }
      }
    });
  }
}
