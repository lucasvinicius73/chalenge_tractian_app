class NodeModel {
  final String id;
  final String name;
  final String? parentId;
  final String? locationId;
  List<NodeModel> children = [];

  NodeModel(
      {required this.id, required this.name, this.parentId, this.locationId});

  void addChild(NodeModel child) {
    children.add(child);
  }
}
