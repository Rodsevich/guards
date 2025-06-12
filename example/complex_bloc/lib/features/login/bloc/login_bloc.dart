import 'package:app_guards/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({GuardCallback? loginGuardCallback})
    : super(const LoginStateUnauthenticated()) {
    on<LoginEventSignIn>((event, emit) {
      if (loginGuardCallback != null) loginGuardCallback(isSatisfied: true);
      emit(const LoginStateAuthenticated());
    });

    on<LoginEventSignOut>((event, emit) {
      if (loginGuardCallback != null) loginGuardCallback(isSatisfied: false);
      emit(const LoginStateUnauthenticated());
    });
  }
}
