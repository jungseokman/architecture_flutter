part of 'advicer_cubit.dart';

abstract class AdvicerCubitState extends Equatable {
  const AdvicerCubitState();

  @override
  List<Object?> get props => [];
}

class AdvicerInitial extends AdvicerCubitState {}

class AdvicerStateLoading extends AdvicerCubitState {}

class AdvicerStateLoaded extends AdvicerCubitState {
  final String advice;

  const AdvicerStateLoaded({
    required this.advice,
  });

  @override
  List<Object?> get props => [advice];
}

class AdvicerError extends AdvicerCubitState {
  final String message;

  const AdvicerError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}