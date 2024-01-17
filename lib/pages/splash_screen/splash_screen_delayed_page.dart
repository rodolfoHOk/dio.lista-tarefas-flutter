import 'package:flutter/material.dart';
import 'package:lista_tarefas_app/pages/main/main_page.dart';

class SplashScreenDelayedPage extends StatefulWidget {
  const SplashScreenDelayedPage({super.key});

  @override
  State<SplashScreenDelayedPage> createState() =>
      _SplashScreenDelayedPageState();
}

class _SplashScreenDelayedPageState extends State<SplashScreenDelayedPage> {
  void openMain() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const MainPage(title: 'Lista de Tarefas'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    openMain();
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
