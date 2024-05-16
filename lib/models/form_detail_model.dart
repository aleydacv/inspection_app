class FormDetailModel {
  int waterSupply;
  int restroom;
  int wasteDisposal;
  int infrastructure;
  int household;
  int foodPreservation;

  int workWear;
  int fireExtinguisher;
  int firstAidKit;

  String pestName;
  int pestAuthorization;
  int pestReport;

  int biosafetyProtocol;
  int biosafetySigns;
  int faceMask;
  int disposableGloves;
  int hairControl;
  int alcohol;
  int cleaningLog;
  int indoorDisinfection;
  int outdoorDisinfection;
  String desinfectionProduct;

  bool usedOil;
  bool observations;
  String? usedOilValue;
  String? observationValue;

  FormDetailModel(
      {required this.waterSupply,
      required this.restroom,
      required this.wasteDisposal,
      required this.infrastructure,
      required this.household,
      required this.foodPreservation,
      required this.workWear,
      required this.fireExtinguisher,
      required this.firstAidKit,
      required this.pestName,
      required this.pestAuthorization,
      required this.pestReport,
      required this.biosafetyProtocol,
      required this.biosafetySigns,
      required this.faceMask,
      required this.disposableGloves,
      required this.hairControl,
      required this.alcohol,
      required this.cleaningLog,
      required this.indoorDisinfection,
      required this.outdoorDisinfection,
      required this.desinfectionProduct,
      required this.usedOil,
      required this.observations,
      this.usedOilValue,
      this.observationValue});

  Map<String, dynamic> toMap() {
    return {
      'water_supply': waterSupply,
      'restroom_conditions': restroom,
      'waste_disposal': wasteDisposal,
      'general_infrastructure': infrastructure,
      'household_items': household,
      'food_preservations': foodPreservation,
      'workwear': workWear,
      'fire_extinguisher': fireExtinguisher,
      'first_aid_kid': fireExtinguisher,
      'pest_name': pestName,
      'pest_authorization': pestAuthorization,
      'pest_technical_report': pestReport,
      'biosafety_protocol': biosafetyProtocol,
      'biosafety_signs': biosafetySigns,
      'face_mask': faceMask,
      'disposable_gloves': disposableGloves,
      'hair_control': hairControl,
      'alcohol': alcohol,
      'cleaning_log': cleaningLog,
      'indoor_disinfection': indoorDisinfection,
      'outdoor_disinfection': outdoorDisinfection,
      'used_oil': usedOil ? usedOilValue : "N/A",
      'observations': observations ? observationValue : "N/A"
    };
  }
}
