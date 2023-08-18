import 'dart:io';

void main() {
  double Function(double) calcularDesconto = (double valorOriginal) {
    double porcentagemDesconto = 0.2; // 20% de desconto
    return valorOriginal - (valorOriginal * porcentagemDesconto);
  };

  print("Digite o valor original do produto: ");
  double valorOriginal = double.parse(stdin.readLineSync()!);

  double valorComDesconto = calcularDesconto(valorOriginal);
  print("O valor com desconto é: ${valorComDesconto.toStringAsFixed(2)}");
}
