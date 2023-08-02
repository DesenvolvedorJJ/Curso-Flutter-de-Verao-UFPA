import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Container(
          child: Text(
            'Flutterzadas',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          color: Colors.blue,
          alignment: Alignment.center,
          width: 500,
          height: 300,
          transform: Matrix4.rotationZ(0.05),
        ),
      ),
    ),
  ));
}
