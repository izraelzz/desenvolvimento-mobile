import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'jonkenpo.dart';
import 'resultado.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pedra, Papel, Tesoura',
      initialRoute: '/jonkenpo',
      routes: {
        '/jonkenpo': (context) => const tJogo(),
        '/resultado': (context) => const tResultado(),
      },
    );
  }
}
