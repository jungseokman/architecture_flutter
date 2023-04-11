part of 'advicer_bloc.dart';

@immutable
abstract class AdvicerState {}

class AdvicerInitial extends AdvicerState {}

class AdvicerStateLoading extends AdvicerState {}

class AdvicerStateLoaded extends AdvicerState {
  final String advice;

  AdvicerStateLoaded({
    required this.advice,
  });
}

class AdvicerError extends AdvicerState {
  final String message;

  AdvicerError({
    required this.message,
  });
}
