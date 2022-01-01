import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/view/auth_pages/preload_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/view/auth_pages/sign_in_view.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/view/home/home_view.dart';
import 'package:sr_project_flutter/app/views/routes/router.dart';
import './views/routes/router.dart' as Route;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: () => BlocProvider<AuthBloc>(
              create: (context) => AuthBloc(),
              child: MaterialApp(
                onGenerateRoute: Route.Router.generateRoute,
                debugShowCheckedModeBanner: false,
                theme: ThemeData(),
                builder: (context, child) {
                  return BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is Authenticated) {
                        Route.Navigators.pushReplacement(context,
                            routename: ROUTENAME.HOME);
                      } else if (state is Unauthenticated) {
                        Route.Navigators.pushReplacement(context,
                            routename: ROUTENAME.SIGN_IN);
                      } else {
                        Route.Navigators.pushReplacement(context,
                            routename: ROUTENAME.ROOT);
                      }
                    },
                    child: child,
                  );
                },
              ),
            ));
  }
}
