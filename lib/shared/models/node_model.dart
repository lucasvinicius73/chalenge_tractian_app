import 'package:chalenge_tractian_app/shared/models/asset_model.dart';
import 'package:chalenge_tractian_app/shared/models/location_model.dart';

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

  factory NodeModel.createNewNode(NodeModel node) {
    if (node is LocationModel) {
      return LocationModel(
          id: node.id,
          name: node.name,
          parentId: node.parentId,
          locationId: node.locationId);
    } else if (node is AssetModel) {
      return AssetModel(
          id: node.id,
          name: node.name,
          parentId: node.parentId,
          locationId: node.locationId,
          sensorId: node.sensorId,
          sensorType: node.sensorType,
          status: node.status,
          gatewayId: node.gatewayId);
    }
    return NodeModel(id: node.id, name: node.name);
  }
}
