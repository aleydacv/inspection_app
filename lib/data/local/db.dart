import "package:inspection_app/models/form_detail_model.dart";
import "package:inspection_app/models/form_model.dart";
import "package:sqflite/sqflite.dart";
import "package:path/path.dart";

class DB {
  static Future<Database> _openDB() async {
    String path = join(await getDatabasesPath(), 'inspection.db');
    var database = await openDatabase(path, version: 1, onCreate: initDB);
    return database;
  }

  static void initDB(Database database, int version) async {
    await database.execute("CREATE TABLE form("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "sanitary_auth_num TEXT,"
        "notification_reference_num TEXT,"
        "male_sanitary_ci INTEGER,"
        "female_sanitary_ci INTEGER"
        ")");

    await database.execute("CREATE TABLE form_detail("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "form_id INTEGER"
        "water_supply INTEGER,"
        "restroom_conditions INTEGER,"
        "waste_disposal INTEGER,"
        "general_infrastructure INTEGER,"
        "household_items INTEGER,"
        "food_preservations INTEGER,"
        "workwear INTEGER,"
        "fire_extinguisher INTEGER,"
        "first_aid_kid INTEGER,"
        "pest_name TEXT,"
        "pest_authorization INTEGER,"
        "pest_technical_report INTEGER,"
        "biosafety_protocol INTEGER,"
        "biosafety_signs INTEGER,"
        "face_mask INTEGER,"
        "disposable_gloves INTEGER,"
        "hair_control INTEGER,"
        "alcohol INTEGER,"
        "cleaning_log INTERGER"
        "indoor_disinfection INTEGER,"
        "outdoor_disinfection INTEGER,"
        "desinfection_product TEXT,"
        "used_oil INTEGER,"
        "observations TEXT,"
        "FOREIGNER KEY (form_id) REFERENCES form (id)"
        ")");
  }

  static Future<void> insertForm(FormModel form) async {
    Database database = await _openDB();
    database.insert("form", form.toMap());
  }

  static Future<List<FormModel>> getForms() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> formMap = await database.query("form");
    return formMap.map((map) => FormModel.fromMap(map)).toList();
  }

  static Future<void> insertFormDetail(FormDetailModel detail) async {
    Database database = await _openDB();
    database.insert("form_detail", detail.toMap());
  }

  static Future<List<FormDetailModel>> getFormDetail() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> details =
        await database.query("form_detail");
    return details.map((map) => FormDetailModel.fromMap(map)).toList();
  }

  static Future<List<FormDetailModel>> getDetailById(int formId) async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> detailById = await database.query(
      'formdetail',
      where: 'form_id = ?',
      whereArgs: [formId],
    );
    return detailById.map((map) => FormDetailModel.fromMap(map)).toList();
  }
}
