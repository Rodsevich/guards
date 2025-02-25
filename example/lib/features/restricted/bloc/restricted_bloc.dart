import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'restricted_event.dart';
part 'restricted_state.dart';

class RestrictedBloc extends Bloc<RestrictedEvent, RestrictedState> {
  RestrictedBloc() : super(const RestrictedState()) {
    on<RestrictedEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
