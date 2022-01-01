import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sr_project_flutter/app/features/auth/data/models/app_user.dart';
import 'package:sr_project_flutter/app/features/auth/data/repository/user_repository_impl.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/auth_bloc/auth_bloc.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final UserRepositoy userRepositoy;
  final AuthBloc authBloc;
  SignUpCubit(this.userRepositoy, this.authBloc) : super(SignUpInitialState());
  Future<void> signUp(AppUser appUser) async {
    emit(SignUpProcessingState());
    final result = await userRepositoy.registerUser(appUser);
    if (result.success) {
      emit(SignUpFinishedState());
    } else {
      final err = (result.errorResult as String);
      emit(SignUpErrorState(err));
    }
  }
}
