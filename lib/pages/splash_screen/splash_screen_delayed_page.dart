import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lista_tarefas_app/pages/main/main_page.dart';

class SplashScreenDelayedPage extends StatefulWidget {
  const SplashScreenDelayedPage({super.key});

  @override
  State<SplashScreenDelayedPage> createState() =>
      _SplashScreenDelayedPageState();
}

class _SplashScreenDelayedPageState extends State<SplashScreenDelayedPage> {
  void openMain() {
    Future.delayed(const Duration(seconds: 3), () {
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

    return Center(
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w900,
          color: Colors.purple,
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            FadeAnimatedText(
              'SUA LISTA',
              textStyle: GoogleFonts.michroma(),
              textAlign: TextAlign.center,
              duration: const Duration(seconds: 1),
            ),
            TypewriterAnimatedText(
              'DE TAREFAS',
              textStyle: GoogleFonts.michroma(),
              textAlign: TextAlign.center,
              speed: const Duration(milliseconds: 60),
            ),
          ],
        ),
      ),
    );
  }
}
