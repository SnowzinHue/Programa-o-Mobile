import 'dart:async';
import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:atividadepref/services/prefs_service.dart';
import 'package:atividadepref/pages/homepage.dart';
import 'package:atividadepref/pages/verify.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<Widget> futureCall() async {
    bool isAccepted = await PrefsService.isAccepted();

    await Future.delayed(const Duration(seconds: 5), () {});

    if (isAccepted) {
      return Future.value(const HomePage());
    }
    return Future.value(const AcceptPage());
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.network(
          'https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png'),
      title: const Text(
        'Exemplo de Shared Preferences',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.grey.shade400,
      showLoader: true,
      loadingText: const Text('Carregando'),
      futureNavigator: futureCall(),
    );
  }
}
