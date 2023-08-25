import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75, // 75% da largura da tela
      child: Drawer(
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 4 / 9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Minhas Redes',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Minhas Redes',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  _buildSocialButton(
                      Icons.person, 'LinkedIn', () {}, MainAxisAlignment.start),
                  _buildSocialButton(
                      Icons.code, 'GitHub', () {}, MainAxisAlignment.center),
                  _buildSocialButton(
                      Icons.camera, 'Instagram', () {}, MainAxisAlignment.end),
                ],
              ),
            ),
            VerticalDivider(
              color: Colors.white,
              width: MediaQuery.of(context).size.width * 2 / 9,
              thickness: 5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 3 / 9,
              child: Column(
                children: [
                  _buildSectionLink('Home', '/', router, context),
                  _buildSectionLink('Projetos', '/projetos', router, context),
                  _buildSectionLink(
                    'Habilidades e Conhecimentos',
                    '/conhecimentos',
                    router,
                    context,
                  ),
                  _buildSectionLink('Sobre', '/sobre', router, context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String title, VoidCallback onTap,
      MainAxisAlignment mainAlinhamento) {
    return Row(
      mainAxisAlignment: mainAlinhamento,
      children: [
        TextButton(
          onPressed: onTap,
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 8),
              Text(title),
            ],
          ),
        ),
      ],
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
