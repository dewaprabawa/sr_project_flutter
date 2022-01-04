import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sr_project_flutter/app/features/auth/data/models/app_user.dart';
import 'package:sr_project_flutter/app/features/auth/data/repository/user_repository_impl.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:sr_project_flutter/app/shared/helper/final_result.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final UserRepositoy userRepositoy;
  final AuthBloc authBloc;

  SignInCubit(this.userRepositoy, this.authBloc) : super(SignInInitialState());

  Future<void> signIn(String username, String password) async {
    emit(SignInProcessingState());
    UserResult result = await userRepositoy.login(username, password);
    if (result.success) {
      final appUser = (result.successResult as AppUser);
      authBloc.add(LoggedIn(appUser.token));
      emit(SignInFinishedState());
    } else {
      final err = (result.errorResult as String);
      emit(SignInErrorState(err));
    }
  }
}
