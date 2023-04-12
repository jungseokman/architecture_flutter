import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/usecases/advice_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  AdvicerCubit() : super(AdvicerInitial());
  final AdviceUsecases adviceUsecases = AdviceUsecases();

  void adviceRequested() async {
    emit(AdvicerStateLoading());

    final failureOrAdvice = await adviceUsecases.getAdvice();
    failureOrAdvice.fold(
        (failure) => emit(AdvicerError(message: _mapFailureToMessage(failure))),
        (advice) => emit(AdvicerStateLoaded(advice: advice.advice)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'API Error. please try again';
      case CacheFailure:
        return 'cache failed. please try again';
      default:
        return 'something gone wrong. please try again';
    }
  }
}
