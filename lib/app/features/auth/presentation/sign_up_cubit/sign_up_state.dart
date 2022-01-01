part of 'sign_up_cubit.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}


class SignUpInitialState extends SignUpState {}

class SignUpProcessingState extends SignUpState {}

class SignUpErrorState extends SignUpState {
  final String error;

  SignUpErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class SignUpFinishedState extends SignUpState {}