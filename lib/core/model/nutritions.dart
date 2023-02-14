class Nutritions {


  String? food_name;
  String? amount_of_food;
  String? food_date;
  String? food_time;
  String? food_id;
  String? pet_id;
  String? pet_name;

  Nutritions(this.food_name, this.amount_of_food, this.food_date,
      this.food_time, this.food_id, this.pet_id, this.pet_name);

  factory Nutritions.fromJson(String key, Map<dynamic,dynamic> json){

    return Nutritions(json["food_name"] as String, json["amount_of_food"] as String, json["food_date"] as String, json["food_time"] as String, key, json["pet_id"],json["pet_name"] as String );
  }
}