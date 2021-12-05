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

enum ROUTENAME{
  root,
  sign_in,
  sign_up,
}

class Navigators{
    static void pushNamed(BuildContext context,{required ROUTENAME routename, Object? arguments}){
         Navigator.pushNamed(context, _stringRouteGenerator(routename), arguments: arguments);
     }

    static void pushReplacement(BuildContext context,{required ROUTENAME routename, Object? arguments}){
         Navigator.pushReplacementNamed(context, _stringRouteGenerator(routename), arguments: arguments);
     }

      static void pushNamedAndRemoveUntil(BuildContext context,{required ROUTENAME routename, Object? arguments}){
         Navigator.pushNamedAndRemoveUntil(context, _stringRouteGenerator(routename), (route) => false, arguments: arguments);
     }  

    static String _stringRouteGenerator(ROUTENAME routename){
        switch(routename){
          case ROUTENAME.root:
             return "/";
          case ROUTENAME.sign_in:
             return "/sign_in";
          case ROUTENAME.sign_up:
             return "/sign_up";
        }
  }
}