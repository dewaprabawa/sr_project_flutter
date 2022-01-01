import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/sign_in_cubit/sign_in_cubit.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/view/auth_pages/preload_view.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/view/auth_pages/sign_in_view.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/view/auth_pages/sign_up_view.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/view/home/home_view.dart';
import 'package:sr_project_flutter/injection_layer.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => const PreloadView());
      case '/sign_in':
        return CupertinoPageRoute(
            builder: (context) =>  BlocProvider(
                  create: (context) => SignInCubit(
                    sl(),
                    BlocProvider.of<AuthBloc>(context, listen: false)
                  ),
                  child: const SignInView(),
                ));
      case "/sign_up":
        return CupertinoPageRoute(builder: (_) => const SignUpView());
      case "/home":
        return CupertinoPageRoute(builder: (_) => const HomaView());
      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

enum ROUTENAME {
  ROOT,
  SIGN_IN,
  SIGN_UP,
  HOME,
}

class Navigators {
  static void pushNamed(BuildContext context,
      {required ROUTENAME routename, Object? arguments}) {
    Navigator.pushNamed(context, _stringRouteGenerator(routename),
        arguments: arguments);
  }

  static void pushReplacement(BuildContext context,
      {required ROUTENAME routename, Object? arguments}) {
    Navigator.pushReplacementNamed(context, _stringRouteGenerator(routename),
        arguments: arguments);
  }

  static void pushNamedAndRemoveUntil(BuildContext context,
      {required ROUTENAME routename, Object? arguments}) {
    Navigator.pushNamedAndRemoveUntil(
        context, _stringRouteGenerator(routename), (route) => false,
        arguments: arguments);
  }

  static String _stringRouteGenerator(ROUTENAME routename) {
    switch (routename) {
      case ROUTENAME.ROOT:
        return "/";
      case ROUTENAME.SIGN_IN:
        return "/sign_in";
      case ROUTENAME.SIGN_UP:
        return "/sign_up";
      case ROUTENAME.HOME:
        return "/home";
    }
  }
}
