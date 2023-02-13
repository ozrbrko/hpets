class Vaccines {
  String? vaccine_name;
  String? veterinary;
  String? vaccine_date;
  String? vaccine_time;
  String? vaccine_id;
  String? pet_id;
  String? pet_name;

  Vaccines(this.vaccine_name, this.veterinary, this.vaccine_date,
      this.vaccine_time, this.vaccine_id, this.pet_id, this.pet_name);



  factory Vaccines.fromJson( String key,Map<dynamic,dynamic> json){

    return Vaccines(json["vaccine_name"] as String, json["veterinary"] as String,  json["vaccine_date"] as String , json["vaccine_time"] as String,key,json["pet_id"],json["pet_name"] as String );

  }
}