part of 'user_permana_home_number_bloc.dart';

abstract class UserPermanaHomeNumberEvent extends Equatable {
  const UserPermanaHomeNumberEvent();

  @override
  List<Object> get props => [];
}

class UserPermanaHomeNumberGet extends UserPermanaHomeNumberEvent {}

class UserPermanaHomeNumberAdd extends UserPermanaHomeNumberEvent {
  final int permanaHomeNumberId;
  const UserPermanaHomeNumberAdd(this.permanaHomeNumberId);

  @override
  List<Object> get props => [permanaHomeNumberId];
}

class UserPermanaHomeNumberUpdateIsActive extends UserPermanaHomeNumberEvent {
  final int id;
  const UserPermanaHomeNumberUpdateIsActive(this.id);

  @override
  List<Object> get props => [id];
}

class UserPermanaHomeNumberDelete extends UserPermanaHomeNumberEvent {
  final int id;
  const UserPermanaHomeNumberDelete(this.id);

  @override
  List<Object> get props => [id];
}
