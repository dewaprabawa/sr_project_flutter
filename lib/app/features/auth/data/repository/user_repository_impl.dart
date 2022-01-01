
import 'package:sr_project_flutter/app/features/auth/data/datasource/remote_user_data_source.dart';
import 'package:sr_project_flutter/app/features/auth/data/models/app_user.dart';
import 'package:sr_project_flutter/app/shared/helper/final_result.dart';


abstract class UserRepositoy {
   Future<FinalResult> registerUser(AppUser user);
   Future<FinalResult> login(String username, String password);
   Future<FinalResult> getUser();
}

class UserRepositoryImpl implements UserRepositoy {
   
  RemoteUserDataSourceImpl userRemoteDataSourceImpl;

  UserRepositoryImpl(this.userRemoteDataSourceImpl);

  @override
  Future<FinalResult<AppUser, String>> getUser() async {
    try {
      final data = await userRemoteDataSourceImpl.getUser();
      return FinalResult(successResult: data);
    } catch (e){
      return FinalResult(errorResutl: e.toString());
    }
  }

  @override
  Future<FinalResult<AppUser, String>> login(String username, String password) async {
      try {
      final data = await userRemoteDataSourceImpl.login(username, password);
      return FinalResult(successResult: data);
    } catch (e){
      return FinalResult(errorResutl: e.toString());
    }
  }

  @override
  Future<FinalResult> registerUser(AppUser user) async {
        try {
      final data = await userRemoteDataSourceImpl.registerUser(user);
      return FinalResult(successResult: data);
    } catch (e){
      return FinalResult(errorResutl: e.toString());
    }
  }

}