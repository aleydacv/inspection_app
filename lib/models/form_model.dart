class FormModel {
  String sanitaryNumber;
  String notificationNumber;
  int sanitaryCi;
  FormModel(
      {required this.sanitaryNumber,
      required this.notificationNumber,
      required this.sanitaryCi});

  Map<String, String> toMap() {
    return {
      'sanitary_auth_num': sanitaryNumber,
      'notification_reference_num': notificationNumber,
      'sanitary_ci': sanitaryCi == 0 ? "Male" : "Female",
    };
  }
}
