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
    'Avl2': 8.4,
    'Avl3': 9.0,
    'Avl4': 10.0
  };
  List<String> disciplinas = [
    'Algoritmos',
    'Estrutura de dados',
    'Informática Básica'
  ];
  print("Digite seu endereço:");
  String? endereco = stdin.readLineSync();

  print("\n\nNome do aluno: $nome");
  print("Idade: $idade");
  if (anoAtual == anoDeEntrada) {
    ehNovato = 'sim';
  } else {
    ehNovato = 'não';
  }
  print("O aluno é novato: $ehNovato");
  print("Peso do aluno: $peso Kg");
  print("Notas do aluno: $notas");
  print("Disciplinas que o aluno está cursando: $disciplinas");
  if (endereco == null) {
    print("O aluno não possui endereço");
  } else {
    print("Endereço do aluno: $endereco");
  }
}
