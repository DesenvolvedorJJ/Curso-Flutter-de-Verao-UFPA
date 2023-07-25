void main() {
  const String nome = 'João Oliveira';
  int idade = 18;
  int anoAtual = 2023;
  int anoDeEntrada = 2022;
  String ehNovato = '';
  double peso = 75.5;
  Map<String, double> notas = {'Avl1': 7.6, 'Avl2': 11.0, 'Avl3': 9.0, 'Avl4': 7.0};
  List<String> disciplinas = ['Algoritmos', 'Estrutura de dados', 'Informática Básica'];
  String? endereco = null;

  if (notas['Avl4']! < 10) {
    notas.remove('Avl4');
    notas['notaBonus'] = 10.0;
  }
  print("\nAtualizando notas com bonus: $notas");
  
  notas.remove('Avl3');
  print("Atualizando notas, removendo a terceira avaliação: $notas");

  List<double> notas1Semestre = [notas['Avl1']!, notas['Avl2']!];
  print("Notas do primeiro semestre: $notas");

  notas.removeWhere((key, value) => value == 11.0);
  print("Notas atualizadas: $notas");

  var sortedNotas = notas.values.toList()..sort();
  print("Notas ordenadas: $sortedNotas");
}