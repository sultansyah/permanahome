import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permanahome/models/berita_model.dart';
import 'package:permanahome/services/berita_service.dart';

part 'berita_event.dart';
part 'berita_state.dart';

class BeritaBloc extends Bloc<BeritaEvent, BeritaState> {
  BeritaBloc() : super(BeritaInitial()) {
    on<BeritaEvent>((event, emit) async {
      if (event is BeritaGet) {
        try {
          emit(BeritaLoading());

          final berita = await BeritaService().getBerita();

          emit(BeritaSuccess(berita));
        } catch (e) {
          emit(BeritaFailed(e.toString()));
        }
      }
    });
  }
}
