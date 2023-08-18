import 'dart:io';
import 'dart:math';

void main() {
  List<int> randomPrices = generateRandomPrices();
  print("Lista de preços aleatórios: $randomPrices");

  int maxPrice = askForMaxPrice();
  List<int> availablePrices = filterEvenPrices(randomPrices, maxPrice);
  print("Preços disponíveis dos produtos para venda: $availablePrices");
}

List<int> generateRandomPrices() {
  Random random = Random();
  List<int> prices = [];
  for (int i = 0; i < 10; i++) {
    // Gera 10 preços aleatórios entre 1 e 100
    int price = random.nextInt(100) + 1;
    prices.add(price);
  }
  return prices;
}

int askForMaxPrice() {
  print("\nDigite um preço máximo para os produtos:");
  String input = '';
  int maxPrice = 0;
  while (true) {
    input = stdin.readLineSync()!;
    try {
      maxPrice = int.parse(input);
      break;
    } catch (e) {
      print("Valor inválido! Digite um número inteiro:");
    }
  }
  return maxPrice;
}

List<int> filterEvenPrices(List<int> prices, int maxPrice) {
  List<int> evenPrices = [];
  for (int price in prices) {
    if (price <= maxPrice && price.isEven) {
      evenPrices.add(price);
    }
  }
  return evenPrices;
}
