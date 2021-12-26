import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:sr_project_flutter/app/features/auth/data/models/user_model.dart';


abstract class AuthRemoteDataSourceIF {
   Future<UserModel> registerUser(UserModel user);
   Future<UserModel> login(String username, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSourceIF {

  final http.Client client;

  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<UserModel> login(String username, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<UserModel> registerUser(UserModel user) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }

}


