part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => super.props;
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => super.props;
}

class AuthFailed extends AuthState {
  final String e;
  const AuthFailed(this.e);

  @override
  List<Object> get props => super.props;
}

class AuthCheckEmailSuccess extends AuthState {}

class AuthSuccess extends AuthState {
  final UserModel user;
  const AuthSuccess(this.user);

  @override
  List<Object> get props => super.props;
}

class AuthUpdateSuccess extends AuthState {}

class AuthSuccessLogout extends AuthState {}

class AuthFailedUpdate extends AuthState {}
