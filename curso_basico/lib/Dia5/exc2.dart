Stream<int> countDownStream(int numMax) async* {
  for (int i = numMax; i >= 1; i--) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() {
  final Stream<int> countdown = countDownStream(5);
  print("Atenção para a contagem de 5 segundos:\n");
  countdown.listen((count) {
    print(count);
  });
}
