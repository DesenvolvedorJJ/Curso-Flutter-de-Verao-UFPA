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
    'Bebidas': [
      'Refrigerantes',
      'Sucos',
      'Água Mineral',
    ],
    'Saladas': [
      'Vinagrete',
      'Salada de Batata',
      'Salada de Alface',
    ],
  };
  const int? categoria = null;

  runApp(RecipeApp(dados: dados, userCategoria: categoria));
}

class RecipeApp extends StatefulWidget {
  final Map<String, List<String>> dados;
  final int? userCategoria;

  const RecipeApp({
    super.key,
    required this.dados,
    required this.userCategoria,
  });

  @override
  // ignore: library_private_types_in_public_api
  _RecipeAppState createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  String busca = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Minhas receitas')),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        busca = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Buscar pratos',
                    ),
                  ),
                ),
                Expanded(
                  child: RecipeList(
                    dados: widget.dados,
                    userCategoria: widget.userCategoria,
                    busca: busca,
                  ),
                ),
              ],
            ),
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

  const RecipeList({
    super.key,
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

  const RecipeCategory({
    super.key,
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
        const SizedBox(
            height: 8), // Espaço entre o título e os ícones dos pratos
        SizedBox(
          height: 120, // Altura fixa dos containers dos pratos
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // Exibir na horizontal
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final valor = recipes[index];
              if (busca.isNotEmpty && !valor.contains(busca)) {
                return const SizedBox
                    .shrink(); // Oculta o container se não corresponder à busca
              }
              return InkWell(
                onTap: () {
                  _navigateToDetailsScreen(context, valor);
                },
                child: Container(
                  width: 180, // Aumenta a largura dos containers dos pratos
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.restaurant_menu_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                      const SizedBox(
                          height: 8), // Espaço entre o ícone e o texto
                      Text(
                        valor,
                        style: const TextStyle(
                          fontSize: 16, // Diminui o tamanho da fonte do texto
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _navigateToDetailsScreen(BuildContext context, String prato) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeDetailsScreen(prato: prato),
      ),
    );

    if (result == true) {
      // ignore: use_build_context_synchronously
      _showConfirmationDialog(context, prato);
    }
  }

  void _showConfirmationDialog(BuildContext context, String prato) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmação'),
        content: Text('Você selecionou o prato: $prato'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}

class RecipeDetailsScreen extends StatelessWidget {
  final String prato;

  const RecipeDetailsScreen({super.key, required this.prato});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Prato'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Detalhes do prato:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Text(
              prato,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Confirmar Seleção'),
            ),
          ],
        ),
      ),
    );
  }
}
