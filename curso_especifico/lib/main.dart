import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'app/app.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MainApp());
}

/*
import 'package:animated_floating_widget/animated_floating_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FloatingWidgetExample(),
    );
  }
}

class FloatingWidgetExample extends StatelessWidget {
  const FloatingWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: FloatingWidget(
            verticalSpace: 20,
            duration: const Duration(
              seconds: 3,
            ),
            reverseDuration: const Duration(seconds: 1),
            child: Container(
              width: 200,
              height: 60,
              decoration: BoxDecoration(
                  color: const Color(0xff27374D),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text(
                  "Floating widget",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
*/