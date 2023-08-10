import 'package:flutter/material.dart';
import './addProdutos.dart';
import './editarProdutos.dart';
import '../TelaEstatísticas/telaEstatisticas.dart';
import 'produtos.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> products = [];

  void _addProduct() async {
    Product? newProduct = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddProductScreen(),
      ),
    );

    if (newProduct != null) {
      setState(() {
        products.add(newProduct);
      });
    }
  }

  void _showProductDetails(Product product) {
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
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _editProduct(product);
              },
              child: const Text('Editar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _confirmDelete(product);
              },
              child: const Text(
                'Excluir',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _editProduct(Product product) async {
    Product? editedProduct = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProductScreen(product: product),
      ),
    );

    if (editedProduct != null) {
      setState(() {
        int index = products.indexOf(product);
        products[index] = editedProduct;
      });
    }
  }

  void _confirmDelete(Product product) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmar'),
          content: Text('Você tem certeza que deseja excluir ${product.name}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _removeProduct(product);
              },
              child: const Text(
                'Excluir',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _removeProduct(Product product) {
    setState(() {
      products.remove(product);
    });
  }

  void _navigateToStatistics() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StatisticsScreen(products: products),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Produtos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.show_chart),
            onPressed: _navigateToStatistics,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  products[index].name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'X${products[index].quantity}',
                  style: TextStyle(color: Colors.grey[300]),
                ),
              ],
            ),
            subtitle: Text(
              'R\$ ${products[index].price.toStringAsFixed(2)}',
              style: TextStyle(color: Colors.grey[300]),
            ),
            onTap: () {
              _showProductDetails(products[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProduct,
        child: const Icon(Icons.add),
      ),
    );
  }
}
