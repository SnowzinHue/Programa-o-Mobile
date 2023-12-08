import 'package:flutter/material.dart';
import 'package:atividadepref/pages/splashscreen.dart';
import 'package:atividadepref/pages/homepage.dart';
import 'package:atividadepref/pages/verify.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atividade com PrefsServices',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade700),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/accept': (context) => const AcceptPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
