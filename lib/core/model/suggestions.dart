class Suggestions {

  String? suggestion_content;
  String? display_name;
  String? suggestion_key;

  Suggestions(this.suggestion_content, this.display_name, this.suggestion_key);

  factory Suggestions.fromJson(String key, Map<dynamic,dynamic> json){

    return Suggestions(json["suggestion_content"] as String, json["display_name"] as String, key);

  }

}