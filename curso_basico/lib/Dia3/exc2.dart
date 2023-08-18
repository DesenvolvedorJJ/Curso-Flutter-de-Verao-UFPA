import 'dart:io';
import 'dart:math';

void main() {

  Random random = Random();
  int numeroSecreto = random.nextInt(10) + 1;
  int tentativas = 3;

  print("Jogo: Adivinhe o Número!");
  print("Tente adivinhar o número inteiro secreto entre 1 e 10.");
  print("Você tem 3 tentativas.");

  while (tentativas > 0) {
    stdout.write("\nDigite o seu palpite: ");
    int palpite = int.parse(stdin.readLineSync()!);

    if (palpite == numeroSecreto) {
      print("Parabéns! Você acertou o número secreto: $numeroSecreto");
      break;
    } else if (palpite < numeroSecreto) {
      print("Dica: O número secreto é maior que $palpite");
    } else {
      print("Dica: O número secreto é menor que $palpite");
    }
    tentativas--;
    print("Tentativas restantes: $tentativas\n");
  }

  if (tentativas == 0) {
    print("Suas tentativas acabaram. O número secreto era: $numeroSecreto");
  }
}
