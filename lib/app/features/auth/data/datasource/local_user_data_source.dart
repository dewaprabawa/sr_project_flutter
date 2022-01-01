import 'package:sr_project_flutter/app/features/auth/data/models/app_user.dart';

abstract class LocalUserDataSource {
   Future<AppUser> getLocalUser();
}

class LocalUserDataSourceImpl {
   
}