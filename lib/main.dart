import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:sr_project_flutter/injection_layer.dart' as DI;
import 'app/app.dart';
import 'app/features/auth/presentation/sign_in_cubit/sign_in_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await DI.init();
  Bloc.observer = BlocObserver();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthBloc>(
        create: (context) => DI.sl<AuthBloc>()..add(AppStarted())),
    BlocProvider<SignInCubit>(create: (context) => DI.sl<SignInCubit>())
  ], child: const App()));
}
