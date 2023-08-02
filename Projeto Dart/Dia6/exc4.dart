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

  runApp(
    MaterialApp(
      // Todas as categorias
      home: categoria == null
          ? Scaffold(
              appBar: AppBar(
                title: Text('Minhas receitas'),
              ),
              body: ListView(
                children: [
                  Center(
                    child: Text(
                      'Sobremesas',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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
              // Categoria Sobremesas
            )
          : categoria == 1
              ? Scaffold(
                  appBar: AppBar(
                    title: Text('Sobremesas'),
                  ),
                  body: ListView(
                    children: [
                      Center(
                        child: Text(
                          'Sobremesas',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
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
                  // Categoria Pratos principais
                )
              : categoria == 2
                  ? Scaffold(
                      appBar: AppBar(
                        title: Text('Pratos principais'),
                      ),
                      body: ListView(
                        children: [
                          Center(
                            child: Text(
                              'Pratos principais',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children:
                                dados['Pratos principais']!.map((receita) {
                              return Text(
                                receita,
                                style: TextStyle(fontSize: 18),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      // Categoria Aperitivos
                    )
                  : categoria == 3
                      ? Scaffold(
                          appBar: AppBar(
                            title: Text('Aperitivos'),
                          ),
                          body: ListView(
                            children: [
                              Center(
                                child: Text(
                                  'Aperitivos',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
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
                        )
                      : Scaffold(
                          appBar: AppBar(
                            title: Text('Minhas receitas'),
                          ),
                          body: Center(
                            child: Text('A categoria selecionada é inválida.'),
                          ),
                        ),
    ),
  );
}
