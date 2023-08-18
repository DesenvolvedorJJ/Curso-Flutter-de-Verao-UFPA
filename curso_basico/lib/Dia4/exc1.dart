import 'dart:io';

class Veiculo {
  String marca;
  String modelo;
  int anoDeFabricacao;

  Veiculo(this.marca, this.modelo, this.anoDeFabricacao);

  void exibirInfos() {
    print("\nMarca: $marca");
    print("Modelo: $modelo");
    print("Ano de fabricação: $anoDeFabricacao");
  }
}

void main() {
  print("Digite a marca: ");
  String marca = stdin.readLineSync()!;
  print("Digite o modelo: ");
  String modelo = stdin.readLineSync()!;
  print("Digite a ano de fabricação: ");
  int anoDeFabricacao = int.parse(stdin.readLineSync()!);

  Veiculo veiculo1 = Veiculo(marca, modelo, anoDeFabricacao);
  veiculo1.exibirInfos();
}
