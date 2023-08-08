import 'package:flutter/material.dart';

class Peca extends StatelessWidget {
  final String valor;
  final void Function() whenSelect;

  const Peca({
    super.key,
    required this.valor,
    required this.whenSelect,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: whenSelect,
      child: SizedBox(
        width: 90,
        height: 90,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(0.2),
            child: Text(
              valor,
              style: const TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
