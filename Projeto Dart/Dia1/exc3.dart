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

  notas.addAll({'Nota Bonus': 10});

  print("\nAtualizando notas com bonus: $notas");

  notas.remove('Avl3');
  print("Atualizando notas, removendo a terceira avaliação: $notas");

  List<double> notas1Semestre = [notas['Avl1']!, notas['Avl2']!];
  print("Notas do primeiro semestre: $notas1Semestre");

  notas.removeWhere((key, value) => value == 11.0);
  print("Notas atualizadas: $notas");

  var sortedNotas = notas.values.toList()..sort();
  print("Notas ordenadas: $sortedNotas");
}
