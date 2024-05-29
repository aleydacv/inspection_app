class FormDetailModel {
  int? id;
  int formId;

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
      {this.id,
      required this.formId,
      required this.waterSupply,
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

  factory FormDetailModel.fromMap(Map<String, dynamic> map) {
    return FormDetailModel(
        id: map['id'],
        formId: map['form_id'],
        waterSupply: map['water_supply'],
        restroom: map['restroom_conditions'],
        wasteDisposal: map['waste_disposal'],
        infrastructure: map['general_infrastructure'],
        household: map['household_items'],
        foodPreservation: map['food_preservation'],
        workWear: map['workwear'],
        fireExtinguisher: map['fire_extinguisher'],
        firstAidKit: map['first_aid_kit'],
        pestName: map['pest_name'],
        pestAuthorization: map['pest_authorization'],
        pestReport: map['pest_technical_report'],
        biosafetyProtocol: map['biosafety_protocol'],
        biosafetySigns: map['biosafety_signs'],
        faceMask: map['face_mask'],
        disposableGloves: map['disposable_gloves'],
        hairControl: map['hair_control'],
        alcohol: map['alcohol'],
        cleaningLog: map['cleaning_log'],
        indoorDisinfection: map['indoor_disinfection'],
        outdoorDisinfection: map['outdoor_disinfection'],
        desinfectionProduct: map['desinfection_product'],
        usedOil: true,
        usedOilValue: map['used_oil'],
        observations: true,
        observationValue: map['observations']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'form_id': formId,
      'water_supply': waterSupply,
      'restroom_conditions': restroom,
      'waste_disposal': wasteDisposal,
      'general_infrastructure': infrastructure,
      'household_items': household,
      'food_preservation': foodPreservation,
      'workwear': workWear,
      'fire_extinguisher': fireExtinguisher,
      'first_aid_kit': fireExtinguisher,
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
      'desinfection_product': desinfectionProduct,
      'used_oil': usedOil ? usedOilValue : "N/A",
      'observations': observations ? observationValue : "N/A"
    };
  }
}
