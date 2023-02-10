class Notes {
  String? note_title;
  String? note_content;
  String? note_time;
  String? note_date;
  String? note_id;
  String? pet_id;


  Notes(this.note_title, this.note_content, this.note_time, this.note_date,
      this.note_id, this.pet_id, json);

  factory Notes.fromJson( String key,Map<dynamic,dynamic> json){

    return Notes(json["note_title"] as String, json["note_content"] as String,  json["note_time"] as String , json["note_date"] as String,json["note_id"] as String,json["pet_id"],key );

  }
}