import 'package:flutter/material.dart';

void main() {
  final Map<String, List<String>> dados = {
    'Sobremesas': [
      'Torta de Maçã',
      'Mousse de Chocolate',
      'Pudim de Leite Condensado'
    ],
    'Pratos principais': [
      'Frango Assado com Batatas',
      'Espaguete à Bolonhesa',
      'Risoto de Cogumelos'
    ],
    'Aperitivos': [
      'Bolinhos de Queijo',
      'Bruschetta de Tomate e Manjericão',
      'Canapés de Salmão com Cream Cheese'
    ],
  };

  final int? categoria = 1; // Valor arbitrário;
  final String busca =
      'Torta'; // Valor arbitrário para a busca (pode ser vazio para exibir todas as receitas)

  runApp(MaterialApp(
    home: ReceitasScreen(dados: dados, categoria: categoria, busca: busca),
  ));
}

class ReceitasScreen extends StatelessWidget {
  final Map<String, List<String>> dados;
  final int? categoria;
  final String busca;

  ReceitasScreen(
      {required this.dados, required this.categoria, required this.busca});

  @override
  Widget build(BuildContext context) {
    // Filtrar as receitas com base na categoria e na busca
    List<String> receitasFiltradas = [];

    if (categoria == null) {
      // Todas as categorias
      receitasFiltradas.addAll(dados.values.expand((element) => element));
    } else {
      receitasFiltradas.addAll(dados.values.elementAt(categoria! - 1));
    }

    if (busca.isNotEmpty) {
      receitasFiltradas = receitasFiltradas
          .where(
              (receita) => receita.toLowerCase().contains(busca.toLowerCase()))
          .toList();
    }

    // Verificar se existem receitas filtradas e exibir a lista ou mensagem de "Nenhuma receita encontrada"
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas receitas'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          if (categoria == null)
            ...dados.keys.map((categoria) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      categoria,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                  SizedBox(height: 10),
                  ...dados[categoria]!.map((receita) {
                    return Text(
                      receita,
                      style: TextStyle(fontSize: 18),
                    );
                  }).toList(),
                  SizedBox(height: 20),
                ],
              );
            }).toList()
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    dados.keys.elementAt(categoria! - 1),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                SizedBox(height: 10),
                ...receitasFiltradas.map((receita) {
                  return Text(
                    receita,
                    style: TextStyle(fontSize: 18),
                  );
                }).toList(),
                SizedBox(height: 20),
              ],
            ),
          if (receitasFiltradas.isEmpty)
            Center(
              child: Text(
                'Nenhuma receita encontrada',
                style: TextStyle(fontSize: 18),
              ),
            ),
        ],
      ),
    );
  }
}
