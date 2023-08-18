import 'dart:io';

void main() {
  print(
      'Digite um número inteiro de 1 a 7 para ver o dia da semana correspondente:');
  int escolha = int.parse(stdin.readLineSync()!);

  switch (escolha) {
    case 1:
      {
        print("Hoje é domingo");
      }
      break;

    case 2:
      {
        print("Hoje é segunda-feira");
      }
      break;

    case 3:
      {
        print("Hoje é terça-feira");
      }
      break;

    case 4:
      {
        print("Hoje é quarta-feira");
      }
      break;

    case 5:
      {
        print("Hoje é quinta-feira");
      }
      break;

    case 6:
      {
        print("Hoje é sexta-feira");
      }
      break;

    case 7:
      {
        print("Hoje é sábado");
      }
      break;

    default:
      {
        print("Escolha invalida");
      }
      break;
  }
}
