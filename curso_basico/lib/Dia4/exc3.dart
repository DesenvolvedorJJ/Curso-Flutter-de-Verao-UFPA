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

class Carro extends Veiculo {
  int kmPorAno;
  int numDePortas;

  Carro(super.marca, super.modelo, super.anoDeFabricacao, this.kmPorAno,
      this.numDePortas);

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

  Moto(super.marca, super.modelo, super.anoDeFabricacao, this.numDeCilindradas,
      this.possuiPartidaEletrica);

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

        Carro carro =
            Carro(marca, modelo, anoDeFabricacao, kmPorAno, numDePortas);

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

        Moto moto = Moto(marca, modelo, anoDeFabricacao, numDeCilindradas,
            possuiPartidaEletrica);

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

  if (KmPorAno! < 15000) {
    statusCarro = "seminovo";
  } else if (KmPorAno >= 15000 || KmPorAno <= 20000) {
    statusCarro = "usado";
  } else if (KmPorAno > 20000) {
    statusCarro = "antigo";
  }

  if (NumDeCilindradas! < 125) {
    statusMoto = "leve";
  } else if (NumDeCilindradas >= 125 || KmPorAno <= 500) {
    statusMoto = "normal";
  } else if (NumDeCilindradas > 500) {
    statusMoto = "esportiva";
  }

  print("\nInformações sobre os veículos cadastrados anteriormente:");
  print("O carro informado anteriormente é considerado $statusCarro.");
  print("A moto informada anteriormente é considerada $statusMoto.");
}
