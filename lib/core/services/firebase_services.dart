import 'dart:collection';
import 'package:firebase_database/firebase_database.dart';
import 'package:hpets/core/extension/string_extension.dart';
import '../../main.dart';
import '../utils/config.dart';

class AppointmentService {
  static Future<void> addAppointment(String veterinaryInfo, String appointmentDate, String appointmentTime, String petName, String veterinary_address) async {
    var appointmentPets = FirebaseDatabase.instance.ref().child("pets_table").child("appointments").child(Config.token);

    var info = HashMap<String, dynamic>();
    info["veterinary_info"] = veterinaryInfo.toUpperCase();
    info["appointment_date"] = appointmentDate;
    info["appointment_time"] = appointmentTime;
    info["pet_name"] = petName.basHarfleriBuyut();
    info["veterinary_address"] = veterinary_address.basHarfleriBuyut();
    info["appointment_id"] = "";

    appointmentPets.push().set(info);
  }
}

class VaccineService {

  static Future<void> addVaccine(String vaccine_name, String veterinary,
      String vaccine_date, String vaccine_time, String pet_id,
      String pet_name) async {
    var vaccinesPets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token).child(Config.petKey).child("vaccines");

    var info = HashMap<String, dynamic>();
    info["vaccine_name"] = vaccine_name.basHarfleriBuyut();
    info["veterinary"] = veterinary.basHarfleriBuyut();
    info["vaccine_date"] = vaccine_date;
    info["vaccine_time"] = vaccine_time.basHarfleriBuyut();
    info["vaccine_id"] = "";
    info["pet_id"] = pet_id;
    info["pet_name"] = pet_name.basHarfleriBuyut();

    vaccinesPets.push().set(info);
    // allVaccinesPets.push().set(info);
  }
}

class DiseaseService {

  static Future<void> addDisease(String disease_name, String disease_content, String disease_time, String disease_date, String pet_id, String pet_name) async {

    var diseasePets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token).child(Config.petKey).child("diseases");

    var info = HashMap<String,dynamic>();
  info["disease_title"] = disease_name.basHarfleriBuyut();
  info["disease_content"] = disease_content.basHarfleriBuyut();
  info["disease_date"] = disease_date;
  info["disease_time"] = disease_time.basHarfleriBuyut();
  info["disease_id"] = "";
  info["pet_id"] = pet_id;
  info["pet_name"] = pet_name.basHarfleriBuyut();

  diseasePets.push().set(info);
  }
}

class NoteService {

 static Future<void> addNote(String note_title, String note_content, String note_time, String note_date, String pet_id) async {

   var notePets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token).child(Config.petKey).child("notes");

   var info = HashMap<String,dynamic>();
    info["note_title"] = note_title.basHarfleriBuyut();
    info["note_content"] = note_content.basHarfleriBuyut();
    info["note_time"] = note_time;
    info["note_date"] = note_date.basHarfleriBuyut();
    info["note_id"] = "";
    info["pet_id"] = pet_id;

    notePets.push().set(info);
  }
}

class NutritionService {

  static Future<void> addNutrition(String foodName, String amonutFood, String foodTime, String foodDate, String pet_id, String pet_name) async {

    var nutritionPets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token).child(Config.petKey).child("nutritions");

    var info = HashMap<String, dynamic>();
    info["food_name"] = foodName.basHarfleriBuyut();
    info["amount_of_food"] = amonutFood.basHarfleriBuyut();
    info["food_date"] = foodDate;
    info["food_time"] = foodTime.basHarfleriBuyut();
    info["food_id"] = "";
    info["pet_id"] = pet_id;
    info["pet_name"] = pet_name.basHarfleriBuyut();


    nutritionPets.push().set(info);
  }
}

class PetService {

  static Future<void> addPet(String pet_name, String pet_id, String pet_age, String pet_race, String pet_gender, String pet_type,String user_id) async {

    var refPets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token);

    var info = HashMap<String,dynamic>();
    info["pet_name"] = pet_name.basHarfleriBuyut();
    info["pet_id"] = pet_id;
    info["pet_age"] = pet_age;
    info["pet_race"] = pet_race.basHarfleriBuyut();
    info["pet_gender"] = pet_gender;
    info["pet_type"] = pet_type;
    info["user_id"] = user_id;
    info["pet_key"] = "";

    logger.i(user_id);
    refPets.push().set(info);

  }
}

class SuggestionService {
  static Future<void> addSuggestion( String suggestion_content,String display_name) async {
    var suggestionPets = FirebaseDatabase.instance.ref().child("pets_table").child("suggestions");


    var info = HashMap<String, dynamic>();
    info["suggestion_content"] = suggestion_content;
    info["display_name"] = display_name;
    info["suggestion_id"] = "";


    suggestionPets.push().set(info);
  }
}