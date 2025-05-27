part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginStateAuthenticated extends LoginState {
  const LoginStateAuthenticated();
}

final class LoginStateUnauthenticated extends LoginState {
  const LoginStateUnauthenticated();
}
