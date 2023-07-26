import 'dart:io';

double calcularMedia(List<double> notas) {
  if (notas.isEmpty) return 0.0;

  double somaNotas = notas.reduce((valorAtual, valorAnterior) => valorAtual + valorAnterior);
  return somaNotas / notas.length;
}

void main() {
  List<double> notas = [];

  print("Digite a quantidade de notas dos estudantes: ");
  int quantidadeNotas = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= quantidadeNotas; i++) {
    print("Digite a nota $i: ");
    double nota = double.parse(stdin.readLineSync()!);
    notas.add(nota);
  }

  double mediaTurma = calcularMedia(notas);
  print("A média da turma é: ${mediaTurma.toStringAsFixed(2)}");
}
