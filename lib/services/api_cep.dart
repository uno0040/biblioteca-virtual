import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiCep {

Future<Map<String, dynamic>> buscarCEP(String cep) async {
  final response = await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));

  if (response.statusCode == 200) {
    // Parse dos dados retornados para um mapa
    Map<String, dynamic> data = json.decode(response.body);
    return data;
  } else {
    throw Exception('Falha ao buscar o CEP.');
  }
}
}