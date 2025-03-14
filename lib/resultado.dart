import 'package:flutter/material.dart';

class tResultado extends StatelessWidget {
  const tResultado({super.key});

  String _getImagem(String opcao) {
    switch (opcao) {
      case 'pedra':
        return 'imagens/pedra.png';
      case 'papel':
        return 'imagens/papel.png';
      case 'tesoura':
        return 'imagens/tesoura.png';
      default:
        return 'imagens/padrao.png';
    }
  }

  String _getResultado(String turnoB, String turno) {
    if (turnoB == turno) return 'empate';

    final regras = {
      'papel': 'pedra',
      'pedra': 'tesoura',
      'tesoura': 'papel',
    };

    return regras[turno] == turnoB ? 'vitoria' : 'derrota';
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    String turnoB = args['turnoB'];
    String turno = args['turno'];

    String resultado = _getResultado(turnoB, turno);

    String imagemShow =
        {
          'vitoria': 'imagens/vitoria.png',
          'derrota': 'imagens/derrota.png',
          'empate': 'imagens/maos.png',
        }[resultado]!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedra, Papel, Tesoura'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(_getImagem(turnoB), height: 90),
            const SizedBox(height: 20),
            const Text(
              'Escolha do APP',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Image.asset(_getImagem(turno), height: 90),
            const SizedBox(height: 20),
            const Text(
              'Sua Escolha',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Image.asset(imagemShow, height: 90),
            const SizedBox(height: 20),
            Text(
              resultado == 'vitoria'
                  ? 'Você venceu!'
                  : resultado == 'derrota'
                  ? 'Você perdeu!'
                  : 'Empate!',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
              ),
              child: const Text(
                'Jogar novamente',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
