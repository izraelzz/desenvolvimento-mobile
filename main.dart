import 'package:flutter/material.dart';
import 'api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API',
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  Map<String, dynamic>? usuario;

  Future<void> buscarUsuario() async {
    final String id = _controller.text;
    if (int.tryParse(id) == null || int.parse(id) < 1 || int.parse(id) > 12) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Apenas entre 1 e 12')));
      return;
    }

    try {
      final resultado = await ApiService.buscarUsuario(id);

      setState(() {
        usuario = resultado;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString().replaceAll('Exception: ', ''))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Requisição'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            children: [
              Container(
                width: 500,
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(labelText: 'Digite o ID'),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  buscarUsuario();
                },
                child: const Text('Requisitar'),
              ),
              const SizedBox(height: 150),

              if (usuario != null) ...[
                Text(
                  '${usuario!['first_name']} ${usuario!['last_name']}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ClipOval(
                  child: Image.network(
                    usuario!['avatar'],
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  usuario!['email'],
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
