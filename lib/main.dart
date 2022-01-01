import 'package:flutter/material.dart';
import 'package:sr_project_flutter/injection_layer.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionLayer.init(); 
  runApp(const App());
}
