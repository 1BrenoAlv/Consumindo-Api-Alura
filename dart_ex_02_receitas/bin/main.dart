import 'dart:convert';

import 'package:http/http.dart' as http;

void main() {
  getReceitas();
}

final String _url =
    'https://raw.githubusercontent.com/alura-cursos/dart_assincronismo_api/aula05/.json/recipes.json';

Future<void> getReceitas() async {
  final Uri uri = Uri.parse(_url);

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    List<dynamic> listReceita = jsonDecode(response.body);
    final receita = listReceita.firstWhere(
      (r) => r['name'] == 'Bolo de Cenoura',
      orElse: () => Exception('Receita não encontrada!'),
    );
    print(
      'Receita -> ${receita['name']}\nTempo para preparar -> ${receita['preparation_time']}',
    );
    print('------------------------------------------');
    print('Ingredientes');
    final ingrediente = receita['ingredients'];
    for (var ingredientes in ingrediente) {
      print(' - $ingredientes');
    }
    print('------------------------------------------');
    print('Instruções -> ${receita['instructions']}');
  } else {
    print('Erro: ${response.statusCode}');
  }
}
