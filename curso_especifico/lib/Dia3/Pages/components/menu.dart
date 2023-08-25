import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);

    return Container(
      width: MediaQuery.of(context).size.width * 0.75, // 75% da largura da tela
      child: Drawer(
        child: Row(
          children: [
            // TextButtons de Redes Sociais (4/9)
            Container(
              width: MediaQuery.of(context).size.width * 4 / 9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Minhas Redes',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  _buildSocialButton(Icons.person, 'LinkedIn', () {
                    // Lógica para redirecionar para o LinkedIn
                  }),
                  _buildSocialButton(Icons.code, 'GitHub', () {
                    // Lógica para redirecionar para o GitHub
                  }),
                  _buildSocialButton(Icons.camera, 'Instagram', () {
                    // Lógica para redirecionar para o Instagram
                  }),
                ],
              ),
            ),
            // Linha vertical branca (2/9)
            VerticalDivider(
              color: Colors.white,
              width: MediaQuery.of(context).size.width * 2 / 9,
              thickness: 5,
            ),
            // Container de Seções (3/9)
            Container(
              width: MediaQuery.of(context).size.width * 3 / 9,
              child: Column(
                children: [
                  // Seções organizadas em uma coluna
                  _buildSectionLink('Home', '/', router, context),
                  _buildSectionLink('Projetos', '/projetos', router, context),
                  _buildSectionLink('Habilidades e Conhecimentos',
                      '/conhecimentos', router, context),
                  _buildSectionLink('Sobre', '/sobre', router, context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String title, VoidCallback onTap) {
    return TextButton(
      onPressed: onTap,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Text(title),
        ],
      ),
    );
  }

  Widget _buildSectionLink(
      String title, String route, GoRouter router, BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        router.go(route);
        Navigator.pop(context); // Fecha o menu
      },
    );
  }
}
