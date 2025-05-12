import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ServiceRequest {
  //cambiar por el enpoint del servidor
  static const _endpoint = 'https://reqres.in/';

  static Future<Map<String, dynamic>> postService(
      String param, Map<String, dynamic> body,
      {Map<String, String>? headers}) async {
    Map<String, dynamic> res = {'data': null, 'error': null};
    try {
      final url = Uri.parse(_endpoint + param);
      final response = await http.post(url,
          headers:
              headers ?? {HttpHeaders.contentTypeHeader: 'application/json'},
          body: jsonEncode(body));
      if (response.statusCode == 200) {
        res['data'] = jsonDecode(response.body);
      } else {
        final errorResponse = jsonDecode(response.body);
        final message = errorResponse['error'];
        res['error'] = 'Error en la solicitud: $message';
      }
    } catch (error) {
      res['error'] = 'Algo salió mal: $error';
    }
    return res;
  }

  static Future<Map<String, dynamic>> getService(String param) async {
    Map<String, dynamic> res = {'data': null, 'error': null};
    final prefers = await SharedPreferences.getInstance();
    final token = prefers.get('auth_token');
    try {
      final url = Uri.parse(_endpoint + param);
      final response = await http.get(url, headers: {
        HttpHeaders.contentTypeHeader: '/application/json',
        HttpHeaders.authorizationHeader: 'Bearer: $token'
      });
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
