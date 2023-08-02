import 'package:flutter/material.dart';

void main() {
  final Map<String, List<String>> dados = {
    'Sobremesas': [
      'Torta de Maçã',
      'Mousse de Chocolate',
      'Pudim de Leite Condensado',
    ],
    'Pratos principais': [
      'Frango Assado com Batatas',
      'Espaguete à Bolonhesa',
      'Risoto de Cogumelos',
    ],
    'Aperitivos': [
      'Bolinhos de Queijo',
      'Bruschetta de Tomate e Manjericão',
      'Canapés de Salmão com Cream Cheese',
    ],
  };

  const String? userCategoria = null;
  const String busca = "Torta";

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Minhas receitas')),
      body: Column(
          children: dados.entries.map((categoria) {
        if (userCategoria == null || userCategoria == categoria.key) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  categoria.key,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              for (String prato in categoria.value)
                if (prato.contains(busca) || busca.isEmpty)
                  Text(
                    prato,
                    style: const TextStyle(fontSize: 18),
                  )
            ],
          );
        } else {
          return Container();
        }
      }).toList()),
    ),
  ));
}
