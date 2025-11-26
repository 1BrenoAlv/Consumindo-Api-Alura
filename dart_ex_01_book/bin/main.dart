import 'package:dart_ex_01_book/models/books_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  final api = ServiceApi();

  try {
    final books = await api.getBooks();

    final author = books.firstWhere((a) => a.author == 'Machado de Assis');
    print(
      'Título -> ${author.title}\nAutor -> ${author.author}\nData da Publicação -> ${author.yearPublicacao}\nNúmero de Páginas -> ${author.numeroPage}',
    );
  } catch (e) {
    print('Falha na aplicação: $e');
  }
}

class ServiceApi {
  final String _url =
      'https://raw.githubusercontent.com/alura-cursos/dart_assincronismo_api/aula05/.json/books.json';

  Future<List<BooksModel>> getBooks() async {
    final Uri uri = Uri.parse(_url);

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final String jsonList = response.body;
        final List<dynamic> jsonDecoded = jsonDecode(jsonList);
        return jsonDecoded.map((json) => BooksModel.fromJson(json)).toList();
      } else {
        throw Exception('Erro ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Erro de rede ou serialização: $e');
    }
  }
}
