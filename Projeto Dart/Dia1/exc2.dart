import 'dart:io';

void main() {
  print("Digite a redação:");
  String? redacao = stdin.readLineSync();

  bool contemFerias = (redacao ?? "").toLowerCase().contains("férias");
  if (contemFerias == true) {
    print("A redação contém a palavra férias");
  } else {
    print("A redação não contém a palavra férias");
  }

  int contarPalavras(String texto) {
    if (texto.isEmpty) return 0;
    return texto.trim().split(' ').length;
  }

  int qtdPalavras = contarPalavras(redacao!);
  print("Quantidade de palavras na redação: $qtdPalavras");

  String corrigirRedacao(String redacao) {
    return redacao.replaceAll("mais melhor", "melhor");
  }

  String redacaoCorrigida = corrigirRedacao(redacao);
  print("Redação corrigida: $redacaoCorrigida");
}
