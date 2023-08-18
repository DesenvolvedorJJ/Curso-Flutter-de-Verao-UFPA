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

  Map<String, double> pesos = {'Carol': 58.0};

  pesos[nome!] = peso;

  pesos['Maria'] = 55.5;
  pesos['Cirilo'] = 68.2;

  double? pesoNovo = pesos['Cirilo']!;

  pesos.remove('Carol');

  String retorno = "";

  bool contemPrimeiroNome = pesos.containsKey(nome);
  if (contemPrimeiroNome == true) {
    retorno = "sim";
  } else {
    retorno = "não";
  }

  print("Mapa de alunos e pesos: $pesos");
  print("Mapa contém uma chave igual ao nome inserido?\n$retorno");
}
