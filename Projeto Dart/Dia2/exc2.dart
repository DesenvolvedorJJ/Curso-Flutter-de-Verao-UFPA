import 'dart:io';

void main() {
  print('Digite um número inteiro: ');
  int num = int.parse(stdin.readLineSync()!);

  bool ehPar(int num) {
    return num % 2 == 0;
  }

  if (ehPar(num)) {
    print('\n$num é par.');
  } else {
    print('\n$num é ímpar.');
  }
}
