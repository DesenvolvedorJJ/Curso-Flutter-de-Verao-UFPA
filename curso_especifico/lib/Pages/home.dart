import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:async';
import 'components/footer.dart';
import 'components/menu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _borderRadius = 0.0;
  Color _borderColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _animateBorder();
  }

  void _animateBorder() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        _borderRadius = _borderRadius == 0.0 ? 20.0 : 0.0;

        if (_borderColor == Colors.black) {
          _borderColor = Colors.white;
        } else if (_borderColor == Colors.white) {
          _borderColor = Colors.black; // Alterna entre preto e branco
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height / 6),
        child: AppBar(
          title: SizedBox(
            width: 200.0, // Largura do widget
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 32.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold, // Adicionando negrito
                color: Colors.white, // Definindo a cor branca
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    '>_DEVJJ',
                    speed:
                        const Duration(milliseconds: 200 // Ajuste da velocidade
                            ),
                  ),
                ],
              ),
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
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black54,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 80),
              SizedBox(
                height: size.height,
                width: size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,

                        //Primeira decoração

                        children: [
                          Center(
                            child: TweenAnimationBuilder<double>(
                              duration: const Duration(seconds: 2),
                              tween:
                                  Tween<double>(begin: 0.0, end: _borderRadius),
                              builder: (BuildContext context, double value,
                                  Widget? child) {
                                return AnimatedContainer(
                                  duration: const Duration(seconds: 2),
                                  width: 275.0,
                                  height: 105.0,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(value),
                                    border: Border.all(
                                        color: _borderColor, width: 5),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Técnico em DS",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 120),
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 50.0),
                              child: Text(
                                "Experiência com Engenharia e Análise de Dados, Infraestrutura de Hardwares e também, atuação em projetos de desenvolvento Web.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
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
                          //backgroundImage: AssetImage("caminho_imagem.jpg"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }

  /*void _openRightMenu(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Menu()));
  }*/
  void _openRightMenu(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const Menu(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          //const duration = Duration(milliseconds: 500); // Duração da animação

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(seconds: 2), // Duração da transição
      ),
    );
  }
}
