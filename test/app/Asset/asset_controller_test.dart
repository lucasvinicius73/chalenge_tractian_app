import 'package:challenge_tractian_app/providers.dart';
import 'package:challenge_tractian_app/shared/models/asset_model.dart';
import 'package:challenge_tractian_app/shared/models/compane_model.dart';
import 'package:challenge_tractian_app/shared/models/node_model.dart';
import 'package:challenge_tractian_app/app/asset/asset_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  setupProviders();
  var controller = getIt<AssetController>();

  await controller
      .fetchAll(CompanyModel(id: "662fd0ee639069143a8fc387", name: "Jaguar"));

  //await controller.fetchSearch("Motor");
  await controller.fetchFilter("alert");

  for (var node in controller.mapNodes.keys) {
    int depth = controller.mapNodes[node]!;
    print("${"  " * depth}${node.name}");
  }

  group("AssetController Test", () {

    test("Lista de Assets", () async {
      var assets = controller.assets;
      expect(assets[0].name, "CONVEYOR BELT ASSEMBLY");
    });
    test("Lista de Locais", () async {
      var locations = controller.locations;
      expect(locations[0].name, "CHARCOAL STORAGE SECTOR");
    });
    test("Construção da arvore - Primeira Ramificação", () async {
      var root = controller.root;
      expect(root.children[1].name, "Machinery house");
    });
    test("Construção da arvore - Segunda Ramificação", () async {
      var root = controller.root;
      expect(root.children[1].children[0].name, "Fan H12D");
    });
  });
}
