class Pets {
  String? pet_name;
  String? pet_id;
  String? pet_age;
  String? pet_race;
  String? pet_gender;
  String? pet_type;
  String? user_id;

  Pets(this.pet_name, this.pet_id, this.pet_age, this.pet_race, this.pet_gender,
      this.pet_type,this.user_id);

  factory Pets.fromJson(String key, Map<dynamic,dynamic> json){

    return Pets(json["pet_name"] as String, key,  json["pet_age"] as String,  json["pet_race"] as String , json["pet_gender"] as String, json["pet_type"] as String,json["user_id"] );

  }
}