import 'package:flutter/material.dart';
import 'components/menu.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height / 6),
        child: AppBar(
          title: const Text(
            ">_ DEVJJ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 44,
            ),
          ),
          toolbarHeight: size.height / 6,
          backgroundColor: Colors.black54,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 40), // Adiciona espaçamento à direita
              child: IconButton(
                icon: const Icon(Icons.menu, size: 65),
                onPressed: () {
                  _openRightMenu(context);
                },
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.black54,
        padding: const EdgeInsets.all(20),
        height: 5 * size.height / 6,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 80),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.white, width: 5),
                          ),
                          child: const Text(
                            "Técnico em DS",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 120),
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50.0),
                            child: Text(
                              "Experiência com Engenharia e Análise de Dados, Infraestrutura de Hardwares e também, atuação em projetos de desenvolvento Web.",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              "Sempre estou à procura de oportunidades para aprender.",
                              textAlign: TextAlign.justify,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Align(
                      alignment:
                          Alignment.topCenter, // Adjust vertical alignment
                      child: CircleAvatar(
                        radius: 150,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("caminho_imagem.jpg"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openRightMenu(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Menu()));
  }
}
