import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserModel {
  int? id;
  String name;
  String lastname;
  String ci;
  String cellphone;

  UserModel(
      {this.id,
      required this.name,
      required this.lastname,
      required this.ci,
      required this.cellphone});

  factory UserModel.fromJson(Map<String, dynamic> user) {
    return UserModel(
        id: user['id'],
        name: user['name'],
        lastname: user['lastname'],
        ci: user['ci'],
        cellphone: user['cellphone']);
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'lastname': lastname,
      'ci': ci,
      'cellphone': cellphone
    };
  }
}

Future<void> saveUser(UserModel user) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('user_data', jsonEncode(user));
}

Future<String?> getUser() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('user_data');
}
