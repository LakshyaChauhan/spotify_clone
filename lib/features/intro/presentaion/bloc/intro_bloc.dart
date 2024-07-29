import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc() : super(IntroInitial()) {
    on<GetStaretedButtonClickedEvent>(getStaretedButtonClickedEvent);
    on<ChooseModePageContinueButtonClickedEvent>(
        chooseModePageContinueButtonClickedEvent);
  }


 FutureOr<void> getStaretedButtonClickedEvent(
      GetStaretedButtonClickedEvent event, Emitter<IntroState> emit) {
    emit(GetStaretedButtonClickedState());
  }

  FutureOr<void> chooseModePageContinueButtonClickedEvent(
      ChooseModePageContinueButtonClickedEvent event,
      Emitter<IntroState> emit) {
    emit(ChooseModePageContinueButtonClickedState());
  }









}
