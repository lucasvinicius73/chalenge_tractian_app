class CompaneModel {
  final String id;
  final String name;

  CompaneModel({required this.id, required this.name});

  factory CompaneModel.fromJson(Map json){
    return CompaneModel(id: json["id"],name: json["name"]);
  }
  
}