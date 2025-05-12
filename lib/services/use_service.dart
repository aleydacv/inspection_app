import 'package:inspection_app/services/service_request.dart';

class UseService {
  static Future<Map<String, dynamic>> loginUser(
      String user, String password) async {
    final body = {'email': user, 'password': password};
    final response = await ServiceRequest.postService('api/login', body);
    return response;
  }

  static Future<Map<String, dynamic>> getUser() async {
    final response = await ServiceRequest.getService('api/users/2');
    return response;
  }
  
}
