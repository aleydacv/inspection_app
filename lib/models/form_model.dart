class FormModel {
  int? id;
  int userId;
  String sanitaryNumber;
  String notificationNumber;
  int maleSanitaryCi;
  int femaleSanitaryCi;
  String date;
  double latitude;
  double longitude;
  FormModel(
      {this.id,
      required this.userId,
      required this.sanitaryNumber,
      required this.notificationNumber,
      required this.maleSanitaryCi,
      required this.femaleSanitaryCi,
      required this.date,
      required this.latitude,
      required this.longitude});

  factory FormModel.fromMap(Map<String, dynamic> map) {
    return FormModel(
        id: map['id'],
        userId: map['user_id'],
        sanitaryNumber: map['sanitary_auth_num'],
        notificationNumber: map['notification_reference_num'],
        maleSanitaryCi: map['male_sanitary_ci'],
        femaleSanitaryCi: map['female_sanitary_ci'],
        date: map['date'],
        latitude: map['latitude'],
        longitude: map['longitude']);
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'sanitary_auth_num': sanitaryNumber,
      'notification_reference_num': notificationNumber,
      'male_sanitary_ci': maleSanitaryCi,
      'female_sanitary_ci': femaleSanitaryCi,
      'date': date,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
