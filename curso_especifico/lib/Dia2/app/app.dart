import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Pages/about.dart';
import '../Pages/academic_info.dart';
import '../Pages/home.dart';
import '../Pages/projects.dart';
import '../Pages/skills_knowledge.dart';

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
            child: Home(),
          ),
        ),
        GoRoute(
          path: '/projetos',
          pageBuilder: (context, state) => const MaterialPage(
            child: Projects(),
          ),
        ),
        GoRoute(
          path: '/conhecimentos',
          pageBuilder: (context, state) => const MaterialPage(
            child: SkillsKnowledge(),
          ),
        ),
        GoRoute(
          path: '/informacoes',
          pageBuilder: (context, state) => const MaterialPage(
            child: AcademicInformation(),
          ),
        ),
        GoRoute(
          path: '/sobre',
          pageBuilder: (context, state) => const MaterialPage(
            child: About(),
          ),
        ),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
