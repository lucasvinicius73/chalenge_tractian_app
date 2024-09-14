import 'package:chalenge_tractian_app/shared/models/asset_model.dart';
import 'package:chalenge_tractian_app/shared/models/location_model.dart';
import 'package:chalenge_tractian_app/shared/models/node_model.dart';
import 'package:chalenge_tractian_app/shared/repository/http_api_repository.dart';
import 'package:chalenge_tractian_app/shared/states.dart';
import 'package:flutter/material.dart';

class AssetController extends ChangeNotifier {
  HttpApiRepository repository = HttpApiRepository();

  List<LocationModel> locations = [];
  List<AssetModel> assets = [];

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

    // notifyListeners();

    // try {
    //   if (getLocationState() is Complete && getAssetState() is Complete) {

    //     buildTree();
    //   }
    // } catch (e) {

    // }
    notifyListeners();
  }

  getLocations(String companieId) async {
    //setLocationState(Loading());
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
