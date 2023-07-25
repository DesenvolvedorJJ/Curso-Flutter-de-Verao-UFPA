void main() {
  int num = 10;

  bool ehPar(int num) {
  return num % 2 == 0;
  }

  if (ehPar(num)) {
    print('$num é par.');
  } else {
    print('$num é ímpar.');
  }
}