import 'package:connectivity/connectivity.dart';
import 'package:sr_project_flutter/app/features/auth/data/datasource/remote_user_data_source.dart';
import 'package:sr_project_flutter/app/features/auth/data/models/app_user.dart';
import 'package:sr_project_flutter/app/shared/helper/final_result.dart';
import 'package:sr_project_flutter/app/shared/local/local_database.dart';
import 'package:sr_project_flutter/app/shared/network/nt_status.dart';
import 'package:sr_project_flutter/app/shared/exception/exception.dart';

abstract class UserRepositoy {
  Future<FinalResult> registerUser(AppUser user);
  Future<FinalResult> login(String username, String password);
  Future<FinalResult> getUser();
}

class UserRepositoryImpl implements UserRepositoy {
  final RemoteUserDataSourceImpl userRemoteDataSourceImpl;
  final NetworkStatus networkStatus;

  UserRepositoryImpl(this.userRemoteDataSourceImpl, this.networkStatus);

  @override
  Future<FinalResult<AppUser, String>> getUser() async {
    if (await networkStatus.isConnected) {
      try {
        final appUser = await userRemoteDataSourceImpl.getUser();
        LocalDatabase.insertUser(LocalDatabase.APP_USER_TABLE, appUser);
        return FinalResult(success: true, successResult: appUser);
      } catch (e) {
        return FinalResult(success: false, errorResult: e.toString());
      }
    } else {
      try {
        final localAppUser = await LocalDatabase.getAllData(LocalDatabase.APP_USER_TABLE);
        return FinalResult(success:true, successResult: AppUser.fromJson(localAppUser!.first));
      } on LocalDbExceptionimplements catch (e){
        return FinalResult(success: false, errorResult: e.toString());
      }
    }
  }

  @override
  Future<FinalResult<AppUser, String>> login(
      String username, String password) async {
    try {
      final data = await userRemoteDataSourceImpl.login(username, password);
      return FinalResult(success: true,successResult: data);
    } catch (e) {
      return FinalResult(success: false, errorResult: e.toString());
    }
  }

  @override
  Future<FinalResult> registerUser(AppUser user) async {
    try {
      final data = await userRemoteDataSourceImpl.registerUser(user);
      return FinalResult(success: true, successResult: data);
    } catch (e) {
      return FinalResult(success: false, errorResult: e.toString());
    }
  }
}
