import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guard_example/bootstrap.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginStateUnauthenticated()) {
    on<LoginEventSignIn>((event, emit) {
      exampleGuards.login.update(isSatisfied: true);
      emit(const LoginStateAuthenticated());
    });

    on<LoginEventSignOut>((event, emit) {
      exampleGuards.login.update(isSatisfied: false);
      emit(const LoginStateUnauthenticated());
    });
  }

  
}
