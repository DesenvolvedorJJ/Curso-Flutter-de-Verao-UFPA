import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//import 'package:url_launcher/url_launcher.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height,
                  width: size.width,
                  color: Colors.black,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Redes Sociais',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildSocialLink("LinkedIn", "https://www.linkedin.com/seu_perfil"),
                      _buildSocialLink("GitHub", "https://github.com/seu_usuario"),
                      _buildSocialLink("Instagram", "https://www.instagram.com/seu_perfil"),
                    ],
                  ),
                ),
                Container(
                  color: Colors.blue,
                  width: 200, // Set a fixed width for the menu container
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      _buildMenuItem(context, "Home", "/"),
                      _buildMenuItem(context, "Projetos", "/projetos"),
                      _buildMenuItem(context, "Habilidades e Conhecimentos", "/conhecimentos"),
                      _buildMenuItem(context, "Informações Acadêmicas", "/informacoes"),
                      _buildMenuItem(context, "Sobre", "/sobre"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title),
      onTap: () {
        GoRouter.of(context).go(route);
      },
    );
  }

  Widget _buildSocialLink(String title, String link) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: InkWell(
        onTap: () {
          // Implemente a ação de abrir o link aqui
        },
        child: Text(
          title,
          // ignore: prefer_const_constructors
          style: TextStyle(
            fontSize: 16,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
