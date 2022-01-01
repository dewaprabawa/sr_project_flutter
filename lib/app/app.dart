import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sr_project_flutter/app/features/auth/view/preload_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './views/routes/router.dart' as sr;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: () => MaterialApp(
      onGenerateRoute: sr.Router.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: const PreloadView()
    ));
  }
}
