import 'package:challenge_tractian_app/shared/models/asset_model.dart';
import 'package:challenge_tractian_app/shared/models/location_model.dart';
import 'package:challenge_tractian_app/shared/models/node_model.dart';

class TreeBuildService {
  NodeModel buildTree(List<LocationModel> locations, List<AssetModel> assets) {
    Map<String, NodeModel> nodeMap = {};
    NodeModel root = NodeModel(id: "id", name: "root");

    for (var local in locations) {
      nodeMap[local.id] = local;
    }

    for (var asset in assets) {
      nodeMap[asset.id] = asset;
    }

    for (var node in nodeMap.values) {
      String? parentId = node.parentId;
      String? locationId = node.locationId;
      if (parentId == null && locationId == null) {
        root.addChild(node);
      } else if (locationId != null) {
        nodeMap[locationId]!.addChild(node);
      } else {
        nodeMap[parentId]!.addChild(node);
      }
    }

    return root;
  }
}