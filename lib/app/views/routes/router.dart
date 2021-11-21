import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sr_project_flutter/app/views/auth/preload_view.dart';
import 'package:sr_project_flutter/app/views/auth/sign_in_view.dart';
import 'package:sr_project_flutter/app/views/auth/sign_up_view.dart';

class Router {
 static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => const PreloadView());
      case '/sign_in':
        return CupertinoPageRoute(builder: (_) => const SignInView());
      case "/sign_up":
         return CupertinoPageRoute(builder: (_) => const SignUpView());
      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}