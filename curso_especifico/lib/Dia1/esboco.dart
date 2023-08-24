import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:go_router/go_router.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => const MaterialPage(
            child: PortfolioPessoal(),
          ),
        ),
        GoRoute(
          path: '/projetos',
          pageBuilder: (context, state) => const MaterialPage(
            child: ProjetosFeitos(),
          ),
        ),
        GoRoute(
          path: '/contato',
          pageBuilder: (context, state) => const MaterialPage(
            child: Contato(),
          ),
        ),
        GoRoute(
          path: '/habilidades',
          pageBuilder: (context, state) => const MaterialPage(
            child: DescricaoHabilidades(),
          ),
        ),
        GoRoute(
          path: '/academico',
          pageBuilder: (context, state) => const MaterialPage(
            child: InformacoesAcademicas(),
          ),
        ),
        GoRoute(
          path: '/sobre',
          pageBuilder: (context, state) => const MaterialPage(
            child: Sobre(),
          ),
        ),
      ],
    );

    return MaterialApp.router(
      theme: ThemeData.dark(),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}

class PortfolioPessoal extends StatelessWidget {
  const PortfolioPessoal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Portifólio Pessoal")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => GoRouter.of(context).go('/projetos'),
              child: const Text("Projetos Feitos"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => GoRouter.of(context).go('/contato'),
              child: const Text("Contato"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => GoRouter.of(context).go('/habilidades'),
              child: const Text("Descrição de Habilidades"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => GoRouter.of(context).go('/academico'),
              child: const Text("Informações Acadêmicas"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => GoRouter.of(context).go('/sobre'),
              child: const Text("Sobre"),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjetosFeitos extends StatelessWidget {
  const ProjetosFeitos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Projetos Feitos")),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Estamos na tela de Projetos Feitos!")),
        ],
      ),
    );
  }
}

class Contato extends StatelessWidget {
  const Contato({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Contato")),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Estamos na tela de Contato!")),
        ],
      ),
    );
  }
}

class DescricaoHabilidades extends StatelessWidget {
  const DescricaoHabilidades({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Descrição de Habilidades")),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Estamos na tela de Descrição de Habilidades!")),
        ],
      ),
    );
  }
}

class InformacoesAcademicas extends StatelessWidget {
  const InformacoesAcademicas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Informações Acadêmicas")),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Estamos na tela de Informações Acadêmicas!")),
        ],
      ),
    );
  }
}

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Sobre")),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Estamos na tela de Sobre!")),
        ],
      ),
    );
  }
}
