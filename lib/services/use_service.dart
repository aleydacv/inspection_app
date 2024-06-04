import 'package:inspection_app/services/service_request.dart';

class UseService {
  static Future<Map<String, dynamic>> loginUser(String user, String password) async {
    final body = {'user': user, 'password': password};
    final response = await ServiceRequest.postService('api/login', body);
    return response;
  }
}
