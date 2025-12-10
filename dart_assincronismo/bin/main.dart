import 'dart:convert';
import 'package:dart_assincronismo/api_key.dart';
import 'package:http/http.dart' as http;

void main() //async
{
  // try {
  //   List<dynamic> data = await requestData();
  //   print(data[0]);
  // } catch (e) {
  //   print('Ocorreu um erro na requisição: $e');
  // }
  sendDataAsync({
    "id": "ID011",
    "name": "Breno",
    "lastName": "Lima",
    "balance": 113.0,
  });
}

Future<List<dynamic>> requestData() async {
  String url = // url da sua API
      'https://gist.githubusercontent.com/1BrenoAlv/f5ea867d0c6c03fb42e719c56e5047fd/raw/654372715fdd0648e2a06c0ddf616a1b781520e4/accounts.json';
  // Metodo assincrono

  final Uri uri = Uri.parse(
    url,
  ); // converter ela para Uri, para o programa conseguir identificar o seu url completo

  final response = await http.get(uri); // faz uma requisição GET da api
  return json.decode(response.body);
}

Future<void> sendDataAsync(Map<String, dynamic> mapConta) async {
  String url = // url da sua API Para fazer requisição
      'https://api.github.com/gists/f5ea867d0c6c03fb42e719c56e5047fd';
  List<dynamic> listConta = await requestData();
  listConta.add(mapConta);
  String conteudo = json.encode(listConta);
  final response = await http.patch(
    Uri.parse(url),
    headers: {"Authorization": "Bearer $githubApiKey"},
    body: json.encode({
      "description": "accounts.json",
      "public": true,
      "files": {
        "accounts.json": {"content": conteudo},
      },
    }),
  );
  print(response.statusCode);
}
