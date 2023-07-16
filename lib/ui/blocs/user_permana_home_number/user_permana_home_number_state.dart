part of 'user_permana_home_number_bloc.dart';

abstract class UserPermanaHomeNumberState extends Equatable {
  const UserPermanaHomeNumberState();

  @override
  List<Object> get props => [];
}

class UserPermanaHomeNumberInitial extends UserPermanaHomeNumberState {}

class UserPermanaHomeNumberLoading extends UserPermanaHomeNumberState {}

class UserPermanaHomeNumberFailed extends UserPermanaHomeNumberState {
  final String e;
  const UserPermanaHomeNumberFailed(this.e);

  @override
  List<Object> get props => [e];
}

class UserPermanaHomeNumberSuccess extends UserPermanaHomeNumberState {
  final List<UserPermanaHomeNumber> userPermanaHomeNumbers;
  const UserPermanaHomeNumberSuccess(this.userPermanaHomeNumbers);

  @override
  List<Object> get props => [userPermanaHomeNumbers];
}
