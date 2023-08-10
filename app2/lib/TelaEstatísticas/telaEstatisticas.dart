import 'package:flutter/material.dart';
import '../TelaProdutos/produtos.dart';

class StatisticsScreen extends StatefulWidget {
  final List<Product> products;

  const StatisticsScreen({Key? key, required this.products}) : super(key: key);

  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  bool _showLowStockProductsDetails = false;

  @override
  Widget build(BuildContext context) {
    int totalQuantity = 0;
    double totalValue = 0.0;
    List<Product> lowStockProducts = [];

    for (Product product in widget.products) {
      totalQuantity += product.quantity;
      totalValue += product.price * product.quantity;
      if (product.quantity < 5) {
        lowStockProducts.add(product);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Estatísticas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategoryRow(
              context,
              Icons.info,
              'Quantidade Total:',
              '$totalQuantity',
            ),
            const Divider(),
            _buildCategoryRow(
              context,
              Icons.info,
              'Preço Total:',
              'R\$${totalValue.toStringAsFixed(2)}',
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                if (lowStockProducts.isNotEmpty) {
                  setState(() {
                    _showLowStockProductsDetails =
                        !_showLowStockProductsDetails;
                  });
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(''),
                        content:
                            const Text('Não há produtos com estoque baixo.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Fechar'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.info),
                      SizedBox(width: 8.0),
                      Text('Produtos com Estoque Baixo:'),
                    ],
                  ),
                  Icon(_showLowStockProductsDetails
                      ? Icons.arrow_upward
                      : Icons.arrow_downward),
                ],
              ),
            ),
            const Divider(),
            if (_showLowStockProductsDetails)
              Column(
                children: lowStockProducts.isNotEmpty
                    ? lowStockProducts.map((product) {
                        return GestureDetector(
                          onTap: () {
                            _showProductDetails(context, product);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildProductRow(product),
                              const Divider(),
                            ],
                          ),
                        );
                      }).toList()
                    : [
                        const Text(
                          'Não há produtos com estoque baixo.',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryRow(
      BuildContext context, IconData iconData, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(iconData),
            const SizedBox(width: 8.0),
            Text(title),
          ],
        ),
        Text(value),
      ],
    );
  }

  Widget _buildProductRow(Product product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            product.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Text('X${product.quantity}'),
      ],
    );
  }

  void _showProductDetails(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(product.name),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Preço: R\$${product.price.toStringAsFixed(2)}'),
              Text('Descrição: ${product.description}'),
              Text('Quantidade no estoque: ${product.quantity}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
