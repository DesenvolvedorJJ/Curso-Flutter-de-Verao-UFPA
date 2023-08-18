import 'dart:io';

void main() {
  print("Digite seu nome:");
  String? nome = stdin.readLineSync();
  print("Digite sua idade:");
  int idade = int.parse(stdin.readLineSync()!);
  int anoAtual = 2023;
  print("Digite seu ano de entrada:");
  int anoDeEntrada = int.parse(stdin.readLineSync()!);
  String ehNovato = '';
  print("Digite seu peso:");
  double peso = double.parse(stdin.readLineSync()!);
  Map<String, double> notas = {
    'Avl1': 7.6,
    'Avl2': 11.0,
    'Avl3': 9.0,
    'Avl4': 11.0
  };
  List<String> disciplinas = [
    'Algoritmos',
    'Estrutura de dados',
    'Informática Básica'
  ];
  print("Digite seu endereço:");
  String? endereco = stdin.readLineSync();

  print("Digite o peso que a balança forneceu:");
  String? pesoBalanca =
      stdin.readLineSync(); // Exemplo de valor arbitrário recebido da balança
  print("Peso lido da balança foi: $pesoBalanca");
  double pesoAtualDouble = double.parse(pesoBalanca!);
  int pesoAtual = pesoAtualDouble.toInt();

  pesoAtual = pesoAtual.abs();
  pesoAtual = pesoAtual.round();
  print("Peso atualizado do aluno: $pesoAtual Kg");
}
