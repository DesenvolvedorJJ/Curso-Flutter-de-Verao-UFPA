import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'Dia2/app/app.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MainApp());
}
