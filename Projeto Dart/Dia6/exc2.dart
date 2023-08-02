import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Minhas receitas')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              'Sobremesas',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
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
          Center(
            child: Text(
              'Pratos principais',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
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
          Center(
            child: Text(
              'Aperitivos',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
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
    ),
  ));
}
