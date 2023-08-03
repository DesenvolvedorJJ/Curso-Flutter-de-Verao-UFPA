import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Container(
          width: 600,
          height: 300,
          transform: Matrix4.rotationZ(0.05),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),
          ),
          child: Text(
            'Flutterzadas',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
    )),
  );
}
