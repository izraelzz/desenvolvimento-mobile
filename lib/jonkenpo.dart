import 'dart:math';
import 'package:flutter/material.dart';

class tJogo extends StatefulWidget {
  const tJogo({super.key});

  @override
  State<tJogo> createState() => _tJogoState();
}

class _tJogoState extends State<tJogo> {
  String turnoB = 'imagens/padrao.png';

  void _jogada(String turno) {
    List<String> opcoes = ['pedra', 'papel', 'tesoura'];
    String turnoB = opcoes[Random().nextInt(opcoes.length)];

    Navigator.pushNamed(
      context,
      '/resultado',
      arguments: {'turnoB': turnoB, 'turno': turno},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedra, Papel, Tesoura'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(turnoB, height: 90),
          const SizedBox(height: 20),
          const Text(
            'Escolha do APP ( Aleatório )',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _jogada('pedra'),
                child: Image.asset('imagens/pedra.png', height: 70),
              ),
              const SizedBox(width: 30),
              GestureDetector(
                onTap: () => _jogada('papel'),
                child: Image.asset('imagens/papel.png', height: 70),
              ),
              const SizedBox(width: 30),
              GestureDetector(
                onTap: () => _jogada('tesoura'),
                child: Image.asset('imagens/tesoura.png', height: 70),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
