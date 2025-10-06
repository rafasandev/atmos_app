import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl =
      'http://3.150.34.227:5678/webhook/07ebfeb1-1878-4eeb-b8f4-d5ee4c5f91d8?lat=-23.55&lon=-46.63&start_date=2025-10-01&end_date=2025-10-05';
  Future<Map<String, dynamic>> fetchData() async {
    try {
      final http.Response response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body[0]);
      } else {
        throw Exception('Falha ao carregar os dados da API');
      }
    } catch (e) {
      throw Exception('Erro de conexão: $e');
    }
  }
}
