import 'package:flutter/material.dart';
import 'package:sr_project_flutter/app/views/auth/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: () => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: const PreloadView()
    ));
  }
}
