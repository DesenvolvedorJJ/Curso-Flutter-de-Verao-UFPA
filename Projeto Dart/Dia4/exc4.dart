import 'dart:io';

class Veiculo {
  String marca;
  String modelo;
  int anoDeFabricacao;

  Veiculo(
      {required this.marca,
      required this.modelo,
      required this.anoDeFabricacao});

  void exibirInfos() {
    print("\nMarca: $marca");
    print("Modelo: $modelo");
    print("Ano de fabricação: $anoDeFabricacao");
  }
}

class Carro extends Veiculo {
  int kmPorAno;
  int numDePortas;

  Carro(
      {required super.marca,
      required super.modelo,
      required super.anoDeFabricacao,
      required this.kmPorAno,
      required this.numDePortas});

  void exibirInfos() {
    print("\nMarca: $marca");
    print("Modelo: $modelo");
    print("Ano de fabricação: $anoDeFabricacao");
    print("Quilometragem por ano: $kmPorAno km/ano");
    print("Número de portas: $numDePortas");
  }
}

class Moto extends Veiculo {
  int numDeCilindradas;
  bool possuiPartidaEletrica;

  Moto(
      {required super.marca,
      required super.modelo,
      required super.anoDeFabricacao,
      required this.numDeCilindradas,
      required this.possuiPartidaEletrica});

  void exibirInfos() {
    print("\nMarca: $marca");
    print("Modelo: $modelo");
    print("Ano de fabricação: $anoDeFabricacao");
    print("Número de cilindradas: $numDeCilindradas");
    print("Possui partida elétrica? \n$possuiPartidaEletrica");
  }
}

void main() {
  print('Digite 1 para definir as informações do carro ou 2 para moto');
  int escolha = int.parse(stdin.readLineSync()!);

  bool carroExibido = false;
  bool motoExibida = false;
  int? KmPorAno;
  int? NumDeCilindradas;
  double? precoC;
  double? precoM;

  switch (escolha) {
    infoCarro:
    case 1:
      {
        print("\nDigite a marca do carro: ");
        String marca = stdin.readLineSync()!;
        print("Digite o modelo: ");
        String modelo = stdin.readLineSync()!;
        print("Digite o ano de fabricação: ");
        int anoDeFabricacao = int.parse(stdin.readLineSync()!);
        print("Digite a quilometragem por ano: ");
        int kmPorAno = int.parse(stdin.readLineSync()!);
        KmPorAno = kmPorAno;
        print("Digite o número de portas: ");
        int numDePortas = int.parse(stdin.readLineSync()!);
        print("Digite o preço do veículo: ");
        double preco = double.parse(stdin.readLineSync()!);
        precoC = preco;

        Carro carro = Carro(
            marca: marca,
            modelo: modelo,
            anoDeFabricacao: anoDeFabricacao,
            kmPorAno: kmPorAno,
            numDePortas: numDePortas);

        carroExibido = true;
      }

      if (carroExibido == true && motoExibida == false) {
        continue infoMoto;
      } else if (carroExibido == true && motoExibida == true) {
        break;
      }

    infoMoto:
    case 2:
      {
        print("\nDigite a marca da moto: ");
        String marca = stdin.readLineSync()!;
        print("Digite o modelo: ");
        String modelo = stdin.readLineSync()!;
        print("Digite o ano de fabricação: ");
        int anoDeFabricacao = int.parse(stdin.readLineSync()!);
        print("Digite o número de cilindradas: ");
        int numDeCilindradas = int.parse(stdin.readLineSync()!);
        NumDeCilindradas = numDeCilindradas;
        print("Digite se possui partida elétrica com true ou false: ");
        bool possuiPartidaEletrica = bool.parse(stdin.readLineSync()!);
        print("Digite o preço do veículo: ");
        double preco = double.parse(stdin.readLineSync()!);
        precoM = preco;

        Moto moto = Moto(
            marca: marca,
            modelo: modelo,
            anoDeFabricacao: anoDeFabricacao,
            numDeCilindradas: numDeCilindradas,
            possuiPartidaEletrica: possuiPartidaEletrica);

        motoExibida = true;
      }

      if (motoExibida == true && carroExibido == true) {
        break;
      } else if (motoExibida == true && carroExibido == false) {
        continue infoCarro;
      }

    default:
      {
        print("Escolha invalida");
      }
      break;
  }

  String statusCarro = "";
  String statusMoto = "";
  double? descontoPorcemC;
  double? descontoPorcemM;
  double? precoBase;

  if (KmPorAno! < 15000) {
    statusCarro = "seminovo";
    descontoPorcemC = 0.20;
  } else if (KmPorAno >= 15000 || KmPorAno <= 20000) {
    statusCarro = "usado";
    descontoPorcemC = 0.35;
  } else {
    statusCarro = "antigo";
    descontoPorcemC = 0.70;
  }

  if (NumDeCilindradas! < 125) {
    statusMoto = "leve";
    descontoPorcemM = 0.65;
  } else if (NumDeCilindradas >= 125 || KmPorAno <= 500) {
    statusMoto = "normal";
    descontoPorcemM = 0.40;
  } else {
    statusMoto = "esportiva";
    descontoPorcemM = 0.30;
  }

  if (statusCarro == "seminovo") {
    precoBase = 20.500;
  } else if (statusCarro == "usado") {
    precoBase = 12.700;
  } else if (statusCarro == "antigo") {
    precoBase = 8.300;
  }

  if (statusMoto == "leve") {
    precoBase = 8.500;
  } else if (statusMoto == "normal") {
    precoBase = 13.300;
  } else if (statusMoto == "esportiva") {
    precoBase = 700.000;
  }

  precoBase ??= 0;

  if (precoC != null &&
      precoM != null &&
      descontoPorcemC != null &&
      descontoPorcemM != null) {
    double descontoC = ((precoBase + precoC) / 2) * descontoPorcemC;
    double descontoM = ((precoBase + precoM) / 2) * descontoPorcemM;
    double precoFinalC = ((precoBase + precoC) / 2) - descontoC;
    double precoFinalM = ((precoBase + precoM) / 2) - descontoM;
    print("\nO preço final do carro informado será de: $precoFinalC reais");
    print("O preço final da moto informada será de: $precoFinalM reais");
  } else {
    print("Deu tudo errado...");
  }
}
