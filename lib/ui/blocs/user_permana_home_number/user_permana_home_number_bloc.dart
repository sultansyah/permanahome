import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permanahome/models/user_permana_home_number_model.dart';
import 'package:permanahome/services/user_permana_home_numbers_service.dart';

part 'user_permana_home_number_event.dart';
part 'user_permana_home_number_state.dart';

class UserPermanaHomeNumberBloc
    extends Bloc<UserPermanaHomeNumberEvent, UserPermanaHomeNumberState> {
  UserPermanaHomeNumberBloc() : super(UserPermanaHomeNumberInitial()) {
    on<UserPermanaHomeNumberEvent>((event, emit) async {
      if (event is UserPermanaHomeNumberGet) {
        try {
          emit(UserPermanaHomeNumberLoading());

          final List<UserPermanaHomeNumber> userPermanaHomeNumbers =
              await UserPermanaHomeNumbersService().get();

          emit(UserPermanaHomeNumberSuccess(userPermanaHomeNumbers));
        } catch (e) {
          emit(UserPermanaHomeNumberFailed(e.toString()));
        }
      }

      if (event is UserPermanaHomeNumberAdd) {
        try {
          emit(UserPermanaHomeNumberLoading());

          final isSuccess = await UserPermanaHomeNumbersService()
              .add(event.permanaHomeNumberId);
          if (!isSuccess) {
            throw 'Error';
          }

          final userPermanaHomeNumbers =
              await UserPermanaHomeNumbersService().get();

          emit(UserPermanaHomeNumberSuccess(userPermanaHomeNumbers));
        } catch (e) {
          emit(UserPermanaHomeNumberFailed(e.toString()));
        }
      }

      if (event is UserPermanaHomeNumberUpdateIsActive) {
        try {
          emit(UserPermanaHomeNumberLoading());

          final isSuccess =
              await UserPermanaHomeNumbersService().updateIsActive(event.id);

          if (!isSuccess) {
            throw 'Error';
          }

          final userPermanaHomeNumbers =
              await UserPermanaHomeNumbersService().get();

          emit(UserPermanaHomeNumberSuccess(userPermanaHomeNumbers));
        } catch (e) {
          emit(UserPermanaHomeNumberFailed(e.toString()));
        }
      }

      if (event is UserPermanaHomeNumberDelete) {
        try {
          emit(UserPermanaHomeNumberLoading());

          final isSuccess =
              await UserPermanaHomeNumbersService().delete(event.id);

          if (!isSuccess) {
            throw 'Error';
          }

          final userPermanaHomeNumbers =
              await UserPermanaHomeNumbersService().get();

          emit(UserPermanaHomeNumberSuccess(userPermanaHomeNumbers));
        } catch (e) {
          emit(UserPermanaHomeNumberFailed(e.toString()));
        }
      }
    });
  }
}
