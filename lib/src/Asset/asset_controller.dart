import 'package:chalenge_tractian_app/shared/models/asset_model.dart';
import 'package:chalenge_tractian_app/shared/models/location_model.dart';
import 'package:chalenge_tractian_app/shared/models/node_model.dart';
import 'package:chalenge_tractian_app/shared/repository/http_api_repository.dart';
import 'package:chalenge_tractian_app/shared/states.dart';
import 'package:flutter/material.dart';
import 'package:string_similarity/string_similarity.dart';

class AssetController extends ChangeNotifier {
  HttpApiRepository repository = HttpApiRepository();

  List<LocationModel> locations = [];
  List<AssetModel> assets = [];
  List<NodeModel> path = [];

  StateModel _stateLocation = StateModel();
  StateModel _stateAsset = StateModel();
  StateModel _stateBuildTree = StateModel();

  NodeModel root = NodeModel(
    id: "id",
    name: "name",
  );

  fetchAll(String companieId) async {
    await getAssets(companieId);
    await getLocations(companieId);
    buildTree();
    notifyListeners();
  }

  getLocations(String companieId) async {
    locations = await repository.getLocations(companieId);
    notifyListeners();
  }

  getAssets(String companieId) async {
    assets = await repository.getAssets(companieId);
    notifyListeners();
  }

  buildTree() {
    Map<String, NodeModel> nodeMap = {};

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
  }

  searchNodeForName(String name) {
    if (root.children.isNotEmpty) {
      path.add(root);
    }
  }

  NodeModel? searchAndBuildTree(NodeModel node, String searchTerm) {
    double levelSimilarity = 0.2;

    double similarity =
        node.name.toLowerCase().similarityTo(searchTerm.toLowerCase());

    List<NodeModel> childrenFound = [];

    for (var child in node.children) {
      NodeModel? newNode = searchAndBuildTree(child, searchTerm);
      if (newNode != null) {
        childrenFound.add(newNode);
      }
    }

    if (similarity >= levelSimilarity || childrenFound.isNotEmpty) {
      NodeModel newNode = node is LocationModel
          ? LocationModel(
              id: node.id,
              name: node.name,
              parentId: node.parentId,
              locationId: node.locationId)
          : node is AssetModel
              ? AssetModel(
                  id: node.id,
                  name: node.name,
                  parentId: node.parentId,
                  locationId: node.locationId,
                  sensorId: node.sensorId,
                  sensorType: node.sensorType,
                  status: node.status,
                  gatewayId: node.gatewayId)
              : NodeModel(id: node.id, name: node.name);
      newNode.children = childrenFound;
      return newNode;
    }
    return null;
  }

  NodeModel? filterAndBuildTree(NodeModel node, String filterTerm) {
    bool match = node is AssetModel ? node.status == filterTerm : false;

    List<NodeModel> childrenFound = [];

    for (var child in node.children) {
      NodeModel? newNode = filterAndBuildTree(child, filterTerm);
      if (newNode != null) {
        childrenFound.add(newNode);
      }
    }

    if (match || childrenFound.isNotEmpty) {
      NodeModel newNode = node is LocationModel
          ? LocationModel(
              id: node.id,
              name: node.name,
              parentId: node.parentId,
              locationId: node.locationId)
          : node is AssetModel
              ? AssetModel(
                  id: node.id,
                  name: node.name,
                  parentId: node.parentId,
                  locationId: node.locationId,
                  sensorId: node.sensorId,
                  sensorType: node.sensorType,
                  status: node.status,
                  gatewayId: node.gatewayId)
              : NodeModel(id: node.id, name: node.name);
      newNode.children = childrenFound;
      return newNode;
    }
    return null;
  }

  getAssetState() {
    return _stateAsset;
  }

  getLocationState() {
    return _stateLocation;
  }

  getBuildTreeState() {
    return _stateBuildTree;
  }

  setAssetState(StateModel newState) {
    _stateAsset = newState;
  }

  setLocationState(StateModel newState) {
    _stateLocation = newState;
  }

  setBuildTreeState(StateModel newState) {
    _stateBuildTree = newState;
  }
}
