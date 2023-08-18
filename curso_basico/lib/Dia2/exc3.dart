import 'dart:io';

void main() {
  print('Digite um número inteiro: ');
  int num = int.parse(stdin.readLineSync()!);

  if (num > 10 && num < 20) {
    print("\nO número é maior que 10 e menor que 20? \nverdadeiro");
  } else {
    print("\nO número é maior que 10 e menor que 20? \nfalso");
  }

  if (num == 0 || num == 50) {
    print("O número é igual a 0 ou igual a 50? \nverdadeiro");
  } else {
    print("O número é igual a 0 ou igual a 50? \nfalso");
  }

  if (num != 100 || num == 200) {
    print("O número é diferente de 100 ou igual a 200? \nverdadeiro");
  } else {
    print("O número é diferente de 100 ou igual a 200? \nfalso");
  }
}
