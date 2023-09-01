import 'package:carousel_slider/carousel_slider.dart';
import '../../app/project_info.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCarousel extends StatefulWidget {
  const ProjectCarousel({Key? key}) : super(key: key);

  @override
  _ProjectCarouselState createState() => _ProjectCarouselState();
}

class _ProjectCarouselState extends State<ProjectCarousel> {
  final List<ProjectInfo> projects = [
    ProjectInfo(
      image: 'assets/images/Projeto1.jpg',
      title: 'Projeto 1',
      description:
          'Primeiro projeto web que eu desenvolvi.\nNo ano de 2023, eu elaborei este mini-projeto de uma "empresa fictícia" com tecnologias HTML+CSS para uma avaliação de curso.\n\nPara conferir com mais detalhes, clique no botão e você irá para o meu repositório do Github.',
      link: Uri.parse(
          'https://github.com/DesenvolvedorJJ/primeira-avl-de-topicos.github.io'),
    ),
    ProjectInfo(
      image: 'assets/images/Projeto2.jpg',
      title: 'Projeto 2',
      description:
          'Este projeto ainda está em fase de desenvolvimento.\nA proposta é de criar um site para web com CRUD.\nAté o momento, o projeto aborda tecnologias HTML, CSS, JS, JSP, Banco de dados relacional remoto.\n\nPrevisão para o projeto ficar completo: nov/2023',
      link: Uri.parse('https://github.com/DesenvolvedorJJ/ALJAVA'),
    ),
  ];

  int _hoveredIndex = -1; // Inicialmente nenhum card está sendo focado

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: projects.length,
      options: CarouselOptions(
        height: 600,
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 6),
        autoPlayAnimationDuration: const Duration(seconds: 4),
        autoPlayCurve: Curves.fastOutSlowIn,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
      ),
      itemBuilder: (BuildContext context, int index, int realIndex) {
        bool isHovered = index == _hoveredIndex;

        return MouseRegion(
          onEnter: (_) {
            setState(() {
              _hoveredIndex = index;
            });
          },
          onExit: (_) {
            setState(() {
              _hoveredIndex = -1;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: isHovered ? 1300 : 1200, // Aumenta a largura quando focado
            height: isHovered ? 160 : 150, // Aumenta a altura quando focado
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isHovered ? 20 : 10),
              image: DecorationImage(
                image: AssetImage(projects[index].image), // Caminho da imagem
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), // Aumenta a transparência
                  BlendMode.darken,
                ),
              ),
            ),
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(20),
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Alinhar à esquerda
                children: [
                  Text(
                    projects[index].title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                      height: 100), // Espaçamento entre o título e a descrição
                  Text(
                    projects[index].description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                    textAlign: TextAlign.left, // Alinhar à esquerda
                  ),
                  const SizedBox(
                      height: 100), // Espaçamento entre a descrição e o botão
                  Align(
                    alignment: Alignment
                        .center, // Alinhamento na parte de baixo e centralizado
                    child: ElevatedButton(
                      onPressed: () {
                        _launchUrl(projects[index].link);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Ver Projeto",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Future<void> _launchUrl(Uri url) async {
  await launchUrl(url);
}
