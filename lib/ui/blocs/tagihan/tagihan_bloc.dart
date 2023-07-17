import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permanahome/models/tagihan_model.dart';
import 'package:permanahome/services/tagihan_service.dart';

part 'tagihan_event.dart';
part 'tagihan_state.dart';

class TagihanBloc extends Bloc<TagihanEvent, TagihanState> {
  TagihanBloc() : super(TagihanInitial()) {
    on<TagihanEvent>((event, emit) async {
      if (event is TagihanGetLatest) {
        try {
          emit(TagihanLoading());

          final Tagihan tagihan = await TagihanService()
              .getLatestTagihan(event.permanaHomeNumberId);

          emit(TagihanSuccess(tagihan));
        } catch (e) {
          emit(TagihanFailed(e.toString()));
        }
      }
    });
  }
}
