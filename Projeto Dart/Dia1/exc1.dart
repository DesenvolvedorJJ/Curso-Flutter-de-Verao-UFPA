void main() {
  const String nome = 'João Oliveira';
  int idade = 18;
  int anoAtual = 2023;
  int anoDeEntrada = 2022;
  String ehNovato = '';
  double peso = 75.5;
  Map<String, double> notas = {'Avl1': 7.6, 'Avl2': 8.4, 'Avl3': 9.0, 'Avl4': 10.0};
  List<String> disciplinas = ['Algoritmos', 'Estrutura de dados', 'Informática Básica'];
  String? endereco = null;
  
  print("Nome do aluno: $nome");
  print("Idade: $idade");
  if (anoAtual == anoDeEntrada) {
    ehNovato = 'sim';
  } else {
    ehNovato = 'não';
  }
  print("O aluno é novato: $ehNovato");
  print("Peso do aluno: $peso Kg");
  print("Notas do aluno: $notas");
  print("Disciplinas que o aluno está cursando: $disciplinas");
  if (endereco == null) {
    print("O aluno não possui endereço");
  } else {
    print("Endereço do aluno: $endereco");
  }
}