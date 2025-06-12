part of 'take_photo_bloc.dart';

sealed class TakePhotoEvent extends Equatable {
  const TakePhotoEvent();

  @override
  List<Object> get props => [];
}

final class TakePhotoEventGoHome extends TakePhotoEvent {}
