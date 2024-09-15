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

  bool showFab = false;

  NodeModel root = NodeModel(
    id: "id",
    name: "name",
  );

  fetchAll(String companieId) async {
    setBuildTreeState(Loading());
    mapNodes.clear();
    try {
      await getAssets(companieId);
      await getLocations(companieId);
      await buildTree();
      await printTree(root);
      setBuildTreeState(Complete());
    } catch (e) {
      setBuildTreeState(Error(error: "$e"));
    }

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
      NodeModel newNode = NodeModel.createNewNode(node);
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
      NodeModel newNode = NodeModel.createNewNode(node);

      newNode.children = childrenFound;
      return newNode;
    }
    return null;
  }

  Map<NodeModel, int> mapNodes = {};

  printTree(NodeModel node, [int depth = 0]) {
    mapNodes[node] = depth;
    for (var child in node.children) {
      printTree(child, depth + 1);
    }
    notifyListeners();
  }

  setShowFab(bool set) {
    print("Mostrando a FAB");
    showFab = set;
    notifyListeners();
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
