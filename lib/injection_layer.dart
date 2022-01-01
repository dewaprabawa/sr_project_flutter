import 'package:get_it/get_it.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/sign_in_cubit/sign_in_cubit.dart';
import 'package:sr_project_flutter/app/shared/network/nt_status.dart';

import 'app/features/auth/data/datasource/remote_user_data_source.dart';
import 'app/features/auth/data/repository/user_repository_impl.dart';

final sl = GetIt.instance;

class InjectionLayer {
  static Future<void> init() async {
    sl.registerLazySingleton<RemoteUserDataSource>(
      () => RemoteUserDataSourceImpl(sl()),
    );

    sl.registerLazySingleton<UserRepositoryImpl>(
      () => UserRepositoryImpl(sl(), sl()),
    );

    sl.registerFactory<SignInCubit>(() => SignInCubit(sl(), sl()));

    sl.registerLazySingleton<NetworkStatusImpl>(() => NetworkStatusImpl(sl()));
  }
}
