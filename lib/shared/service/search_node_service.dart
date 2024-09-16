import 'package:challenge_tractian_app/shared/models/asset_model.dart';
import 'package:challenge_tractian_app/shared/models/node_model.dart';
import 'package:string_similarity/string_similarity.dart';

class SearchNodeService {
  NodeModel? searchAndBuildTree(NodeModel node, String searchTerm, double similarityThreshold) {
    double similarity = node.name.toLowerCase().similarityTo(searchTerm.toLowerCase());
    List<NodeModel> childrenFound = [];

    for (var child in node.children) {
      NodeModel? newNode = searchAndBuildTree(child, searchTerm, similarityThreshold);
      if (newNode != null) {
        childrenFound.add(newNode);
      }
    }

    if (similarity >= similarityThreshold || childrenFound.isNotEmpty) {
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
}
