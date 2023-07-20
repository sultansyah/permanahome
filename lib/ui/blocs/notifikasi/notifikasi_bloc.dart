import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permanahome/models/notifikasi_model.dart';
import 'package:permanahome/services/notifikasi_service.dart';

part 'notifikasi_event.dart';
part 'notifikasi_state.dart';

class NotifikasiBloc extends Bloc<NotifikasiEvent, NotifikasiState> {
  NotifikasiBloc() : super(NotifikasiInitial()) {
    on<NotifikasiEvent>((event, emit) async {
      if (event is NotifikasiEventGet) {
        try {
          emit(NotifikasiLoading());
          final List<Notifikasi> notifikasi;

          if (event.permanaHomeNumberId != null) {
            notifikasi = await NotifikasiService()
                .gets(permanaHomeNumberId: event.permanaHomeNumberId);
          } else {
            notifikasi = await NotifikasiService().gets();
          }

          emit(NotifikasiSuccess(notifikasi));
        } catch (e) {
          emit(NotifikasiFailed(e.toString()));
        }
      }
    });
  }
}
