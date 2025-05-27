import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'signout_event.dart';
part 'signout_state.dart';

class SignoutBloc extends Bloc<SignoutEvent, SignoutState> {
  SignoutBloc() : super(const SignoutState()) {
    on<SignoutEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
