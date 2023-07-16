import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tagihan_event.dart';
part 'tagihan_state.dart';

class TagihanBloc extends Bloc<TagihanEvent, TagihanState> {
  TagihanBloc() : super(TagihanInitial()) {
    on<TagihanEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
