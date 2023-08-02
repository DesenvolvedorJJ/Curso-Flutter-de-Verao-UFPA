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

  runApp(MaterialApp(
    if (categoria == null)
      // Todas as categorias
      home: Scaffold(
        appBar: AppBar(
          title: Text('Minhas receitas'),
        ),
        body: ListView(
          children: [
            Center(
            child: Text(
              'Sobremesas',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: dados['Sobremesas']!.map((receita) {
              return Text(
                receita,
                style: TextStyle(fontSize: 18),
              );
            }).toList(),
          ),
          Center(
            child: Text(
              'Pratos principais',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: dados['Pratos principais']!.map((receita) {
              return Text(
                receita,
                style: TextStyle(fontSize: 18),
              );
            }).toList(),
          ),
          Center(
            child: Text(
              'Aperitivos',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: dados['Aperitivos']!.map((receita) {
              return Text(
                receita,
                style: TextStyle(fontSize: 18),
              );
            }).toList(),
          ),
          ],
        ),
      );
    } else if (categoria == 1) {
      // Categoria Sobremesas
      return Scaffold(
        appBar: AppBar(
          title: Text('Sobremesas'),
        ),
        body: ListView(
          children: [
            Center(
            child: Text(
              'Sobremesas',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: dados['Sobremesas']!.map((receita) {
              return Text(
                receita,
                style: TextStyle(fontSize: 18),
              );
            }).toList(),
          ),
          ],
        ),
      );
    } else if (categoria == 2) {
      // Categoria Pratos principais
      return Scaffold(
        appBar: AppBar(
          title: Text('Pratos principais'),
        ),
        body: ListView(
          children: [
          Center(
            child: Text(
              'Pratos principais',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: dados['Pratos principais']!.map((receita) {
              return Text(
                receita,
                style: TextStyle(fontSize: 18),
              );
            }).toList(),
          ),
          ],
        ),
      );
    } else if (categoria == 3) {
      // Categoria Aperitivos
      return Scaffold(
        appBar: AppBar(
          title: Text('Aperitivos'),
        ),
        body: ListView(
          children: [
          Center(
            child: Text(
              'Aperitivos',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: dados['Aperitivos']!.map((receita) {
              return Text(
                receita,
                style: TextStyle(fontSize: 18),
              );
            }).toList(),
          ),
          ],
        ),
      );
    } else {
      // Categoria inválida
      return Scaffold(
        appBar: AppBar(
          title: Text('Minhas receitas'),
        ),
        body: Center(
          child: Text('A categoria selecionada é inválida.'),
        ),
      );
    }
  ));
}
