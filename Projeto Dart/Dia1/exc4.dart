import 'dart:math';

void main() {
  const String nome = 'João Oliveira';
  int idade = 18;
  int anoAtual = 2023;
  int anoDeEntrada = 2022;
  String ehNovato = '';
  double peso = 75.5;
  Map<String, double> notas = {'Avl1': 7.6, 'Avl2': 8.4, 'Avl3': 9.0, 'Avl4': 10.0};
  List<String> disciplinas = ['Algoritmos', 'Estrutura de dados', 'Informática Básica'];
  String? endereco = null;
  
  String pesoBalanca = "75.7"; // Exemplo de valor arbitrário recebido da balança
  print("Peso lido da balança: $pesoBalanca");
  double pesoAtualDouble = double.parse(pesoBalanca);
  int pesoAtual = pesoAtualDouble.toInt();
  
  int pesoAtualAbs = pesoAtual.abs();
  print("Peso atual absoluto do aluno: $pesoAtualAbs Kg");
  
  int pesoArredondado = pesoAtualAbs.round();
  print("Peso arredondado do aluno: $pesoArredondado Kg");
}