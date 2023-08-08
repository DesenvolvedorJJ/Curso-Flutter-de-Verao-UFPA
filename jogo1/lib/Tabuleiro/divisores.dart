import 'package:flutter/material.dart';

class DivisorX extends StatelessWidget {
  const DivisorX({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 375,
      height: 3,
      margin: const EdgeInsets.symmetric(horizontal: 20),
    );
  }
}

class DivisorY extends StatelessWidget {
  const DivisorY({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 3,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 20),
    );
  }
}
