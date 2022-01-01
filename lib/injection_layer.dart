import 'package:get_it/get_it.dart';

import 'app/features/auth/data/datasource/remote_user_data_source.dart';
import 'app/features/auth/data/repository/user_repository_impl.dart';

final sl = GetIt.instance;

class InjectionLayer{
  InjectionLayer.init() {
  sl.registerLazySingleton<RemoteUserDataSource>(
    () => RemoteUserDataSourceImpl(sl()),
  );

   sl.registerLazySingleton<UserRepositoryImpl>(
    () => UserRepositoryImpl(sl(), sl()),
  );
}
}