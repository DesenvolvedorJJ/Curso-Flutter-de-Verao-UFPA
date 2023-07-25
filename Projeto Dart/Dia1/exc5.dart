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
  
  Map<String, double> pesos = {'Carol': 58.0};

  pesos[nome] = peso;

  pesos['Maria'] = 55.5;
  pesos['Cirilo'] = 68.2;

  double pesoNovo = pesos['Cirilo']!;

  pesos.remove('Carol');

  bool contemPrimeiroNome = pesos.containsKey(nome);

  print("Mapa de alunos e pesos: $pesos");
  print("Peso do aluno adicionado anteriormente (Cirilo): $pesoNovo Kg");
  print("Mapa contém uma chave igual ao primeiro nome? $contemPrimeiroNome");
}
