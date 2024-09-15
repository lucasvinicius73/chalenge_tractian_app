import 'package:challenge_tractian_app/shared/models/asset_model.dart';
import 'package:challenge_tractian_app/shared/models/node_model.dart';
import 'package:challenge_tractian_app/app/Asset/asset_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  var controller = AssetController();

  await controller.fetchAll("662fd0ee639069143a8fc387");

  // NodeModel? searchNode =
  //     controller.searchAndBuildTree(controller.root, "Motor");
  // NodeModel? filteredRoot =
  //     controller.filterAndBuildTree(controller.root, "alert");

  controller.printTree(controller.root);

  for (var node in controller.mapNodes.keys) {
    int depth = controller.mapNodes[node]!;
    print("${"  "*depth}${node.name}");
  }
}



  // group("AssetController Test", () {
  //   test("Lista de Assets", () async {
  //     await controller.getAssets("662fd0ee639069143a8fc387");
  //     var assets = controller.assets;
  //     expect(assets[0].name, "CONVEYOR BELT ASSEMBLY");
  //   });
  //   test("Lista de Locais", () async {
  //     await controller.getLocations("662fd0ee639069143a8fc387");
  //     var locations = controller.locations;
  //     expect(locations[0].name, "CHARCOAL STORAGE SECTOR");
  //   });
  //   test("Construção da arvore", () async {
  //     await controller.fetchAll("662fd0ee639069143a8fc387");
  //     var root = controller.root;
  //     expect(root.children[1].name, "Machinery house");
  //   });
  //   test("Construção da arvore Segunda Ramificação", () async {
  //     await controller.fetchAll("662fd0ee639069143a8fc387");
  //     var root = controller.root;
  //     expect(root.children[1].children[0].name, "Fan H12D");
  //   });
  // });

