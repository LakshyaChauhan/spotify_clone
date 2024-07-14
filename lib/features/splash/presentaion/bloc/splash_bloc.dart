import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<MoveToAnotherScreenEvent>(moveToAnotherScreenEvent);
  }

  FutureOr<void> moveToAnotherScreenEvent(
      MoveToAnotherScreenEvent event, Emitter<SplashState> emit) async {
    await Future.delayed(const Duration(seconds: 2));
    emit(MoveToAnotherScreenState());
  }
}
