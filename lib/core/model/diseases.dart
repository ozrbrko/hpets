class Diseases {


  String? disease_title;
  String? disease_content;
  String? disease_date;
  String? disease_time;
  String? disease_id;
  String? pet_id;
  String? pet_name;

  Diseases(this.disease_title, this.disease_content, this.disease_date,
      this.disease_time, this.disease_id, this.pet_id, this.pet_name);

  factory Diseases.fromJson( String key,Map<dynamic,dynamic> json){

    return Diseases(json["disease_title"] as String, json["disease_content"] as String,  json["disease_date"] as String , json["disease_time"] as String,key,json["pet_id"],json["pet_name"] as String );

  }


}