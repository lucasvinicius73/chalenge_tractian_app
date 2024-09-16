import 'package:challenge_tractian_app/shared/models/asset_model.dart';
import 'package:challenge_tractian_app/shared/models/compane_model.dart';
import 'package:challenge_tractian_app/shared/models/location_model.dart';
import 'package:challenge_tractian_app/shared/models/node_model.dart';
import 'package:challenge_tractian_app/shared/repository/http_api_repository.dart';
import 'package:challenge_tractian_app/shared/states.dart';
import 'package:flutter/material.dart';
import 'package:string_similarity/string_similarity.dart';

class AssetController extends ChangeNotifier {
  HttpApiRepository repository = HttpApiRepository();

  List<LocationModel> locations = [];
  List<AssetModel> assets = [];
  List<NodeModel> path = [];
  Map<NodeModel, int> mapNodes = {};
  NodeModel? searchNode;

  StateModel _stateBuildTree = StateModel();

  bool showFab = false;
  bool critic = false;
  bool operating = false;

  NodeModel root = NodeModel(
    id: "id",
    name: "name",
  );

  fetchAll(CompanyModel companyModel) async {
    setBuildTreeState(Loading());
    disposeAll();
    root = NodeModel(id: "id", name: companyModel.name);
    try {
      await getAssets(companyModel.id);
      await getLocations(companyModel.id);
      await buildTree();
      await printTree(root);
      setBuildTreeState(Complete());
    } catch (e) {
      setBuildTreeState(Error(error: "$e"));
    }

    notifyListeners();
  }

  fetchSearch(String stringSearch) async {
    setBuildTreeState(Loading());
    mapNodes.clear();
    try {
      searchNode = searchAndBuildTree(root, stringSearch);
      await printTree(searchNode!);
      setBuildTreeState(Complete());
    } catch (e) {
      setBuildTreeState(Error(error: "$e"));
    }
    notifyListeners();
  }

  fetchFilter(String stringFilter) async {
    setBuildTreeState(Loading());
    mapNodes.clear();
    try {
      searchNode = filterAndBuildTree(root, stringFilter);
      await printTree(searchNode!);
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

  printTree(NodeModel node, [int depth = 0]) {
    mapNodes[node] = depth;
    if (node.isExpanded) {
      for (var child in node.children) {
        printTree(child, depth + 1);
      }
    }
    notifyListeners();
  }

  void updateTree() {
    mapNodes.clear();
    printTree(root);
    notifyListeners();
  }
  void updateTreeSearch() {
    mapNodes.clear();
    printTree(searchNode!);
    notifyListeners();
  }

  setShowFab(bool set) {
    print("Mostrando a FAB");
    showFab = set;
    notifyListeners();
  }

  disposerTreeView() {
    mapNodes.clear();
    notifyListeners();
  }

  changeFilterState(String status) {
    if (status == "operating") {
      operating = !operating;
      print("Status Operating : $operating");
      if (operating == true) {
        critic = false;
        fetchFilter(status);
      } else {
        disposeSearch();
      }
      notifyListeners();
    } else if (status == "alert") {
      critic = !critic;
      print("Status Critic: $critic");

      if (critic == true) {
        operating = false;
        fetchFilter(status);
      } else {
        disposeSearch();
      }
      notifyListeners();
    }
  }

  disposeAll() {
    critic = false;
    operating = false;
    mapNodes.clear();
    searchNode = null;
  }

  disposeSearch() {
    setBuildTreeState(Loading());
    critic = false;
    operating = false;
    mapNodes.clear();
    searchNode = null;
    printTree(root);
    setBuildTreeState(Complete());
    notifyListeners();
  }

  getBuildTreeState() {
    return _stateBuildTree;
  }

  setBuildTreeState(StateModel newState) {
    _stateBuildTree = newState;
  }
}
