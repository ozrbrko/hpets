class Appointments {


  String? veterinary_info;
  String? appointment_date;
  String? appointment_time;
  String? veterinary_address;
  String? appointment_id;
  String? pet_id;
  String? pet_name;

  Appointments(
      this.pet_name,
      this.veterinary_info,
      this.appointment_date,
      this.appointment_time,
      this.veterinary_address,
      this.appointment_id,
      this.pet_id);

  factory Appointments.fromJson(String key, Map<dynamic,dynamic> json){

    return Appointments(json["pet_name"] as String, json["veterinary_info"] as String, json["appointment_date"] as String, json["appointment_time"] as String, json["veterinary_address"] as String, key, json["pet_id"], );
  }

}