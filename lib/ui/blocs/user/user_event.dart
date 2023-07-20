part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserEventUpdate extends UserEvent {
  final UserModel user;
  const UserEventUpdate(this.user);

  @override
  List<Object> get props => [user];
}
