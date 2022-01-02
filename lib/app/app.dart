import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/view/auth_pages/boarding_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/view/auth_pages/preload_view.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/view/auth_pages/sign_in_view.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/view/home/home_view.dart';
import 'package:sr_project_flutter/app/views/routes/router.dart';
import './views/routes/router.dart' as Route;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
    return ScreenUtilInit(
      builder: () => MaterialApp(
        navigatorKey: _navigatorKey,
        onGenerateRoute: Route.Router.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        builder: (context, child) {
          return BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is Authenticated) {
                _navigatorKey.currentState?.pushReplacementNamed("/home");
              } else if (state is Unauthenticated) {
                _navigatorKey.currentState?.pushReplacementNamed("/");
              } else {
                _navigatorKey.currentState?.pushReplacementNamed("/");
              }
            },
            child: child,
          );
        },
      ),
    );
  }
}
