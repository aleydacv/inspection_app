class FormModel {
  int? id;
  String sanitaryNumber;
  String notificationNumber;
  int maleSanitaryCi;
  int femaleSanitaryCi;
  String date;
  int lat;
  int long;
  FormModel(
      {this.id,
      required this.sanitaryNumber,
      required this.notificationNumber,
      required this.maleSanitaryCi,
      required this.femaleSanitaryCi,
      required this.date,
      required this.lat,
      required this.long
      });

  factory FormModel.fromMap(Map<String, dynamic> map) {
    return FormModel(
        id: map['id'],
        sanitaryNumber: map['sanitary_auth_num'],
        notificationNumber: map['notification_reference_num'],
        maleSanitaryCi: map['male_sanitary_ci'],
        femaleSanitaryCi: map['female_sanitary_ci'],
        date: map['date'],
        lat: map['lat'],
        long: map['long']
        );
        
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sanitary_auth_num': sanitaryNumber,
      'notification_reference_num': notificationNumber,
      'male_sanitary_ci': maleSanitaryCi,
      'female_sanitary_ci': femaleSanitaryCi,
      'date': date,
      'lat': lat,
      'long':long,
    };
  }
}
