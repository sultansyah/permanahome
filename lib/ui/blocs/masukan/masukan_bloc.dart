import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permanahome/models/masukan_model.dart';
import 'package:permanahome/services/masukan_service.dart';

part 'masukan_event.dart';
part 'masukan_state.dart';

class MasukanBloc extends Bloc<MasukanEvent, MasukanState> {
  MasukanBloc() : super(MasukanInitial()) {
    on<MasukanEvent>((event, emit) async {
      if (event is MasukanEventAdd) {
        try {
          emit(MasukanLoading());

          await MasukanService().add(event.masukan);

          emit(MasukanSuccess());
        } catch (e) {
          emit(MasukanFailed(e.toString()));
        }
      }
    });
  }
}
