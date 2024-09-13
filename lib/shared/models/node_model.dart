class NodeModel {
  final String id;
  final String name;
  final String? parentId;
  final String? locationId;

  NodeModel(
      {required this.id,
      required this.name,
      required this.parentId,
      required this.locationId});

  factory NodeModel.fromJson(Map json) {
    return NodeModel(
        id: json["id"],
        name: json["name"],
        parentId: json["parentId"],
        locationId: json["locationId"]);
  }
}
