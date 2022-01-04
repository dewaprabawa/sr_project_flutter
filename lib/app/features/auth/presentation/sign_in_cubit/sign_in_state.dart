part of 'sign_in_cubit.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitialState extends SignInState {}

class SignInProcessingState extends SignInState {}

class SignInErrorState extends SignInState {
  final String error;

  const SignInErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class SignInFinishedState extends SignInState {}
