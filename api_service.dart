import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map<String, dynamic>?> buscarUsuario(String id) async {
    final url = Uri.parse('https://reqres.in/api/users/$id');

    try {
      final resposta = await http.get(url);

      if (resposta.statusCode == 200){
        final dados = jsonDecode(resposta.body);
        return dados ['data'];
      }

      else if (resposta.statusCode == 404){
        throw Exception('Usuário não encontrado!');
      }

      else {
        throw Exception('Bugou foi tudo');
      }

    } catch (e) {
      throw Exception('Erro no sistema');
    }
  }
}
