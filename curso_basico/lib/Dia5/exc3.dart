Future<int> futurewait1() async {
  int contaComplicada = 1 + 1;
  await Future.delayed(const Duration(seconds: 1));
  return contaComplicada;
}

Future<String> futurewait2() async {
  String resposta = "O Dart é uma linguagem de programação fortemente tipada " +
      "inicialmente criada pela Google em 2011.";
  await Future.delayed(const Duration(seconds: 3));
  return resposta;
}

Future<String> futurewait3() async {
  bool onOrOff = false;
  await Future.delayed(const Duration(seconds: 7));
  if (onOrOff == true) {
    return "Eh verdade";
  } else {
    return "Eh mentira";
  }
}

Future<void> main() async {
  final future1 = futurewait1();
  final future2 = futurewait2();
  final future3 = futurewait3();

  final int resultado1 = await future1;
  final String resultado2 = await future2;
  final String resultado3 = await future3;

  print('Dados obtidos da Future 1: $resultado1');
  print('Dados obtidos da Future 2: $resultado2');
  print('Dados obtidos da Future 3: $resultado3');
}
