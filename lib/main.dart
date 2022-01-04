import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sr_project_flutter/app/bloc_observer.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:sr_project_flutter/injection_layer.dart' as di;
import 'app/app.dart';
import 'app/features/auth/presentation/sign_in_cubit/sign_in_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await di.init();
  Bloc.observer = AppBlocObserver();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthBloc>(
        create: (context) => di.sl<AuthBloc>()..add(AppStarted())),
    BlocProvider<SignInCubit>(create: (context) => di.sl<SignInCubit>())
  ], child: const App()));
}
