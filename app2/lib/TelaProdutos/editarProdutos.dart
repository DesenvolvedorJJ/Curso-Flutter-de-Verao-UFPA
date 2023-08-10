import 'package:flutter/material.dart';
import 'produtos.dart';

class EditProductScreen extends StatefulWidget {
  final Product product;

  const EditProductScreen({super.key, required this.product});

  @override
  // ignore: library_private_types_in_public_api
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  int quantity = 0;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.product.name;
    priceController.text = widget.product.price.toString();
    descriptionController.text = widget.product.description;
    quantity = widget.product.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nome do Produto'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Forneça o nome do produto';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Preço'),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Defina um preço';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Forneça um valor de preço válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Descrição'),
              ),
              const SizedBox(
                  height: 16.0), // Adicionei um espaçamento maior aqui
              const Text('Quantidade:'),
              const SizedBox(
                  height: 8.0), // Adicionei um espaçamento maior aqui
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (quantity > 0) {
                          quantity--;
                        }
                      });
                    },
                  ),
                  const SizedBox(
                      width: 16.0), // Adicionei um espaçamento maior aqui
                  Text(
                    quantity.toString(),
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(
                      width: 16.0), // Adicionei um espaçamento maior aqui
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                  height: 24.0), // Adicionei um espaçamento maior aqui
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String name = nameController.text;
                    double price = double.tryParse(priceController.text) ?? 0.0;
                    String description = descriptionController.text;

                    if (name.isNotEmpty && price > 0) {
                      Navigator.pop(
                        context,
                        Product(
                          name: name,
                          price: price,
                          description: description,
                          quantity: quantity,
                        ),
                      );
                    }
                  }
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
