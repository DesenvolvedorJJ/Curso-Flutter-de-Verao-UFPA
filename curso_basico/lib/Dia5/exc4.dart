import 'dart:async';
import 'dart:io';

void main() {
  print("Digite uma lista de nomes separados por vírgula:");
  String input = stdin.readLineSync() ?? '';
  final List<String> nomes = input.split(',');

  Stream<List<String>> nomesStream = Stream.value(nomes);

  Stream<List<int>> lengthNomes =
      nomesStream.map((nomes) => nomes.map((nome) => nome.length).toList());

  lengthNomes.toList().then((lengthsList) {
    print('\nComprimentos dos nomes: $lengthsList');
  });
}
