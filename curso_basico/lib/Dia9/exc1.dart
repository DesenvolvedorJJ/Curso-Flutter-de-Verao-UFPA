// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Tela(),
  ));
}

class Tela extends StatefulWidget {
  const Tela({super.key});

  @override
  _TelaState createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  int? valor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RadioListTile(
            title: const Text('Opção 1'),
            value: 1,
            groupValue: valor,
            onChanged: (novoValor) {
              setState(() {
                valor = novoValor;
              });
            },
          ),
          RadioListTile(
            title: const Text('Opção 2'),
            value: 2,
            groupValue: valor,
            onChanged: (novoValor) {
              setState(() {
                valor = novoValor;
              });
            },
          ),
          RadioListTile(
            title: const Text('Opção 3'),
            value: 3,
            groupValue: valor,
            onChanged: (novoValor) {
              setState(() {
                valor = novoValor;
              });
            },
          ),
        ],
      ),
    );
  }
}
