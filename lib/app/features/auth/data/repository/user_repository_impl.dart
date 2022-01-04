import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:sr_project_flutter/app/features/auth/data/datasource/remote_user_data_source.dart';
import 'package:sr_project_flutter/app/features/auth/data/models/app_user.dart';
import 'package:sr_project_flutter/app/shared/helper/final_result.dart';
import 'package:sr_project_flutter/app/shared/local/local_database.dart';
import 'package:sr_project_flutter/app/shared/network/nt_status.dart';
import 'package:sr_project_flutter/app/shared/exception/exception.dart';

abstract class UserRepositoy {
  Future<UserResult> registerUser(AppUser user);
  Future<UserResult> login(String username, String password);
  Future<UserResult> getUser();
}

class UserResult implements FinalResult<AppUser,String>{
  @override
  String? errorResult;

  @override
  bool success;

  @override
  AppUser? successResult;
  
  UserResult(this.success,{this.successResult, this.errorResult});
}

class UserRepositoryImpl implements UserRepositoy {
  final RemoteUserDataSourceImpl userRemoteDataSourceImpl;
  final NetworkStatus networkStatus;

  UserRepositoryImpl(this.userRemoteDataSourceImpl, this.networkStatus);

  @override
  Future<UserResult> getUser() async {
    if (await networkStatus.isConnected) {
      try {
        final appUser = await userRemoteDataSourceImpl.getUser();
        LocalDatabase.insertUser(LocalDatabase.APP_USER_TABLE, appUser);
        return UserResult(true, successResult: appUser);
      } catch (e) {
        return UserResult(false, errorResult: e.toString());
      }
    } else {
      try {
        final localAppUser =
            await LocalDatabase.getAllData(LocalDatabase.APP_USER_TABLE);
        return UserResult(true,
            successResult: AppUser.fromJson(localAppUser!.first));
      } on LocalDbExceptionimplements catch (e) {
        return UserResult(false, errorResult: e.toString());
      }
    }
  }

  @override
  Future<UserResult> login(
      String username, String password) async {
    try {
      final data = await userRemoteDataSourceImpl.login(username, password);
      log("token ${data.token}");
      return UserResult(true, successResult: data);
    } catch (e) {
      return UserResult(false, errorResult: e.toString());
    }
  }

  @override
  Future<UserResult> registerUser(AppUser user) async {
    try {
      final data = await userRemoteDataSourceImpl.registerUser(user);
      return UserResult(true, successResult: data);
    } catch (e) {
      return UserResult(false, errorResult: e.toString());
    }
  }
}
