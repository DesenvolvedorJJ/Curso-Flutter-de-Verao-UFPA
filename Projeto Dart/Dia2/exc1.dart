import 'dart:io';

void main() {
  print("Exercício 1 simples de calculadora:\n");
  print('Digite um número inteiro: ');
  int num1 = int.parse(stdin.readLineSync()!);
  print('Digite outro número inteiro: ');
  int num2 = int.parse(stdin.readLineSync()!);
  int soma = num1 + num2;
  int subtracao = num1 - num2;
  int multiplicacao = num1 * num2;
  double divisao = num1 / num2;
  int restoDaDivisao = num1 % num2;

  print("\nResultado de soma: $soma");
  print("Resultado de subtração: $subtracao");
  print("Resultado de multiplicação: $multiplicacao");
  print("Resultado de divisão: $divisao");
  print("Resultado de resto da divisão: $restoDaDivisao");
}
