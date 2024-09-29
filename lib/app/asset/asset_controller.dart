import 'package:challenge_tractian_app/shared/models/asset_model.dart';
import 'package:challenge_tractian_app/shared/models/compane_model.dart';
import 'package:challenge_tractian_app/shared/models/location_model.dart';
import 'package:challenge_tractian_app/shared/models/node_model.dart';
import 'package:challenge_tractian_app/shared/repository/http_api_repository.dart';
import 'package:challenge_tractian_app/shared/service/search_node_service.dart';
import 'package:challenge_tractian_app/shared/service/tree_build_service.dart';
import 'package:challenge_tractian_app/shared/states/states.dart';
import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

class AssetController extends ChangeNotifier {
  final HttpApiRepository repository;
  final TreeBuildService treeBuildService;
  final SearchNodeService searchNodeService;

  AssetController({
    required this.repository,
    required this.treeBuildService,
    required this.searchNodeService,
  });

  List<LocationModel> locations = [];
  List<AssetModel> assets = [];
  NodeModel root = NodeModel(id: "id", name: "name");

  Map<NodeModel, int> mapNodes = {};
  NodeModel? searchNode;
  StateModel _state = Loading();

  bool showFab = false;
  bool critic = false;
  bool operating = false;

  fetchAll(CompanyModel companyModel) async {
    setState(Loading());
    disposeAll();
    await _fetchAssetsAndLocations(companyModel.id);
    root = treeBuildService.buildTree(companyModel.name, locations, assets);
    _updateTree(root);
    notifyListeners();
  }

  fetchSearch(String stringSearch) async {
    setState(Loading());
    try {
      searchNode =
          searchNodeService.searchAndBuildTree(root, stringSearch, 0.2);
      _updateTree(searchNode!);
      setState(Complete());
    } catch (e) {
      setState(Error(error: "$e"));
    }
    notifyListeners();
  }

  fetchFilter(String filterTerm) async {
    setState(Loading());
    try {
      searchNode = searchNodeService.filterAndBuildTree(root, filterTerm);
      _updateTree(searchNode!);
      setState(Complete());
    } catch (e) {
      setState(Error(error: "$e"));
    }
  }

  Future<void> _fetchAssetsAndLocations(String companyId) async {
    final results = await Future.wait([
      repository.getLocations(companyId),
      repository.getAssets(companyId),
    ]);
    final resultLocations =
        results[0] as Result<List<LocationModel>, StateModel>;
    final resultAssets = results[1] as Result<List<AssetModel>, StateModel>;

    void handleResult<NodeModel>(Result<List<NodeModel>, StateModel> result,
        Function(List<NodeModel>) onSuccess) {
      result.onSuccess((data) {
        onSuccess(data);
      }).onFailure((data) {
        setState(data);
      });
    }

    handleResult(resultLocations, (data) => locations = data);
    handleResult(resultAssets, (data) => assets = data);

    if (resultLocations.isSuccess() && resultAssets.isSuccess()) {
      setState(Complete());
    }
  }

  void _updateTree(NodeModel node) {
    mapNodes.clear();
    printTree(node);
    notifyListeners();
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
    _updateTree(root);
  }

  void updateTreeSearch() {
    if (searchNode != null) {
      _updateTree(searchNode!);
    }
  }

  void disposeAll() {
    critic = false;
    operating = false;
    mapNodes.clear();
    searchNode = null;
  }

  void disposeSearch() {
    setState(Loading());
    critic = false;
    operating = false;
    mapNodes.clear();
    searchNode = null;
    _updateTree(root);
    setState(Complete());
  }

  setShowFab(bool set) {
    print("Mostrando a FAB");
    showFab = set;
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

  getState() => _state;

  setState(StateModel newState) {
    _state = newState;
    notifyListeners();
  }
}
