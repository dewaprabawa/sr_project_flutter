import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sr_project_flutter/app/app.dart';
import 'package:sr_project_flutter/app/features/auth/data/models/app_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if(event is AppStarted){
        final token = await _loadToken("token");
        if(token != null){
           emit(Authenticated()); 
        }else{
           emit(Unauthenticated()); 
        }
      }else if(event is LoggedIn){
        _saveToken(event.token);
        emit(Authenticated());
      }else if(event is LoggedOut){
        emit(Unauthenticated());
      }
    });
  }

  Future<void> _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

   Future<String?> _loadToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
}
