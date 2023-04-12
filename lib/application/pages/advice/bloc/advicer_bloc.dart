import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/usecases/advice_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

const String generalFailureMessage = "something gone wrong. please try again";
const String serverFailureMessage = "API failed. please try again";
const String cacheFailureMessage = "cache failed. please try again";

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {
    on<AdvicerEvent>((event, emit) async {
      final AdviceUsecases adviceUsecases = AdviceUsecases();

      emit(AdvicerStateLoading());

      debugPrint('fake get advice triggered');

      final failureOrAdvice = await adviceUsecases.getAdvice();
      failureOrAdvice.fold(
          (failure) =>
              emit(AdvicerError(message: _mapFailureToMessage(failure))),
          (advice) => emit(AdvicerStateLoaded(advice: advice.advice)));

      debugPrint('got advice');
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
