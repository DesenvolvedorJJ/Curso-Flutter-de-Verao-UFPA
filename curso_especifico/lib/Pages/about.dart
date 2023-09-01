import 'package:flutter/material.dart';
import 'components/footer.dart';
import 'components/menu.dart';
//const Footer(),

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        //title: const Text("Sua Apresentação"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _openRightMenu(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black54,
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      "Olá, eu sou [Seu Nome]!",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
                const SectionTitle("Informações Profissionais"),
                const ProfessionalInfoItem(
                    "Cargo", "Desenvolvedor de Software"),
                const ProfessionalInfoItem("Empresa", "Minha Empresa Inc."),
                const SectionTitle("Informações Acadêmicas"),
                const AcademicInfoItem(
                    "Grau", "Bacharel em Ciência da Computação"),
                const AcademicInfoItem("Universidade", "Universidade Exemplo"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.transparent,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ProfessionalInfoItem extends StatelessWidget {
  final String label;
  final String value;

  const ProfessionalInfoItem(this.label, this.value, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      subtitle: Text(value),
    );
  }
}

class AcademicInfoItem extends StatelessWidget {
  final String label;
  final String value;

  const AcademicInfoItem(this.label, this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      subtitle: Text(value),
    );
  }
}

void _openRightMenu(BuildContext context) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Menu(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

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
