import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/view/preload_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './views/routes/router.dart' as sr;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: () => BlocProvider<AuthBloc>(
              create: (context) => AuthBloc(),
              child: MaterialApp(
                  onGenerateRoute: sr.Router.generateRoute,
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(),
                  home: BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                     if(state is Authenticated){
                      
                     }
                    },
                    child: PreloadView(),
                  )),
            ));
  }
}
