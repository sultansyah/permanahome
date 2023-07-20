import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permanahome/models/pertanyaan_model.dart';
import 'package:permanahome/services/pertanyaan_service.dart';

part 'pertanyaan_event.dart';
part 'pertanyaan_state.dart';

class PertanyaanBloc extends Bloc<PertanyaanEvent, PertanyaanState> {
  PertanyaanBloc() : super(PertanyaanInitial()) {
    on<PertanyaanEvent>((event, emit) async {
      if (event is PertanyaanEventGet) {
        try {
          emit(PertanyaanLoading());

          final List<Pertanyaan> pertanyaan = await PertanyaanService().gets();

          emit(PertanyaanSuccess(pertanyaan));
        } catch (e) {
          emit(PertanyaanFailed(e.toString()));
        }
      }
    });
  }
}
