class CompanyModel {
  final String id;
  final String name;

  CompanyModel({required this.id, required this.name});

  factory CompanyModel.fromJson(Map json) {
    return CompanyModel(id: json["id"], name: json["name"]);
  }
}
