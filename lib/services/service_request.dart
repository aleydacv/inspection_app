import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ServiceRequest {
  //cambiar por el enpoint del servidor
  static const _endpoint = 'https://reqres.in/';

  static Future<Map<String, dynamic>> postService(
      String param, Map<String, dynamic> body) async {
    Map<String, dynamic> res = {'data': null, 'error': null};
    try {
      final url = Uri.parse(_endpoint + param);
      print("url: $url");
      final response = await http.post(url,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: jsonEncode(body));
      if (response.statusCode == 200) {
        res['data'] = jsonDecode(response.body);
      } else {
        res['error'] = 'Error en la solicitud: ${response.statusCode}';
      }
    } catch (error) {
      res['error'] = 'Algo salió mal: $error';
    }
    return res;
  }
}
