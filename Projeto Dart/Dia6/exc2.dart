import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ReceitasScreen(),
  ));
}

class ReceitasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas receitas'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          // Centraliza as categorias de receitas
          Center(
            child: Text(
              'Sobremesas',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          SizedBox(height: 10),
          // Alinha as receitas à esquerda
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Torta de Maçã',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Mousse de Chocolate',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Pudim de Leite Condensado',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'Pratos principais',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Frango Assado com Batatas',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Espaguete à Bolonhesa',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Risoto de Cogumelos',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'Aperitivos',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bolinhos de Queijo',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Bruschetta de Tomate e Manjericão',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Canapés de Salmão com Cream Cheese',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
