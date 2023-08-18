import 'dart:io';

void main() {
  print('Digite sua idade: ');
  int idade = int.parse(stdin.readLineSync()!);

  if (idade >= 18) {
    print("\nVocê é maior de idade");
  } else {
    print("\nVocê é menor de idade");
  }
}
