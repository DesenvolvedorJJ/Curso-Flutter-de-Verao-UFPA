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
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Text(
                      "Técnico em DS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                  const Text(
                    "Vou ver um texto pra por ainda",
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: CircleAvatar(
                radius: 120,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("caminho_imagem.jpg"),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  void _openRightMenu(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return const MenuScreen();
      },
    );
  }
}
