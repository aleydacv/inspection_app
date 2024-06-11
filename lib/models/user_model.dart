class UserModel {
  final String name;
  final String lastname;
  final String ci;
  final String cellphone;

  UserModel(
      {required this.name,
      required this.lastname,
      required this.ci,
      required this.cellphone});

  factory UserModel.fromJson(Map<String, dynamic> user) {
    return UserModel(
        name: user['name'],
        lastname: user['lastname'],
        ci: user['ci'],
        cellphone: user['cellphone']);
  }
}
