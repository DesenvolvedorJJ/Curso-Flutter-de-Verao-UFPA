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
  final int? categoria = null;
  final String busca = '';

  runApp(RecipeApp(dados: dados, userCategoria: categoria, busca: busca));
}

class RecipeApp extends StatelessWidget {
  final Map<String, List<String>> dados;
  final int? userCategoria;
  final String busca;

  RecipeApp({
    required this.dados,
    required this.userCategoria,
    required this.busca,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Minhas receitas')),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.9,
            child: RecipeList(
                dados: dados, userCategoria: userCategoria, busca: busca),
          ),
        ),
      ),
    );
  }
}

class RecipeList extends StatelessWidget {
  final Map<String, List<String>> dados;
  final int? userCategoria;
  final String busca;

  RecipeList({
    required this.dados,
    required this.userCategoria,
    required this.busca,
  });

  @override
  Widget build(BuildContext context) {
    final List<MapEntry<String, List<String>>> entries = dados.entries.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < entries.length; i++)
          if (userCategoria == null || userCategoria == i + 1)
            Expanded(
              child: RecipeCategory(
                category: entries[i].key,
                recipes: entries[i].value,
                busca: busca,
              ),
            ),
      ],
    );
  }
}

class RecipeCategory extends StatelessWidget {
  final String category;
  final List<String> recipes;
  final String busca;

  RecipeCategory({
    required this.category,
    required this.recipes,
    required this.busca,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            category,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (String valor in recipes)
              if (busca.isEmpty || valor.contains(busca))
                Text(
                  valor,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
          ],
        ),
      ],
    );
  }
}
