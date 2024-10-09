import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guard_example/bootstrap.dart';
import 'package:guards/auto_route.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginStateUnauthenticated()) {
    on<LoginEventSignIn>((event, emit) {
      exampleGuards.login.update(isSatisfied: true);
      emit(const LoginStateAuthenticated());
    });
  }
}
