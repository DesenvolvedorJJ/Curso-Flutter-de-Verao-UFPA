void main() {
  
  String redacao = 'Nas férias de julho, eu não fiz absolutamente '
  + 'nada. é mais melhor não fazer nada do que ficar saindo de casa.';

  bool contemFerias = redacao.toLowerCase().contains("férias");
  if (contemFerias == true) {
    print("A redação contém a palavra férias");
  } else {
    print("A redação não contém a palavra férias");
  }
  
  int contarPalavras(String texto) {
  if (texto.isEmpty) return 0;
  return texto.trim().split(' ').length;
}
  int qtdPalavras = contarPalavras(redacao);
  print("Quantidade de palavras na redação: $qtdPalavras");

  
  String corrigirRedacao(String redacao) {
  return redacao.replaceAll("mais melhor", "melhor");
}
  String redacaoCorrigida = corrigirRedacao(redacao);
  print("Redação corrigida: $redacaoCorrigida");
}