import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  requestData();
}

Future<void> requestData() async {
  // Metodo assincrono
  String url = // Url da sua API
      'https://gist.githubusercontent.com/1BrenoAlv/f5ea867d0c6c03fb42e719c56e5047fd/raw/654372715fdd0648e2a06c0ddf616a1b781520e4/accounts.json';
  final Uri uri = Uri.parse(
    url,
  ); // converter ela para Uri, para o programa conseguir identificar o seu url completo

  final response = await http.get(uri); // faz uma requisição GET da api
  if (response.statusCode == 200) {
    print('Status da requisição: ${response.statusCode}');
    print(response.body);
  } else {
    print('Erro: ${response.statusCode}');
  }

  List<dynamic> listConta = json.decode(response.body);
  print(listConta[0]);
  print('Última coisa a acontecer na função!');
}
