import 'package:chalenge_tractian_app/src/Asset/asset_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  var controller = AssetController();

  group("AssetController Test", () {
    test("Lista de Assets", () async {
      await controller.getAssets("662fd0ee639069143a8fc387");
      var assets = controller.assets;
      expect(assets[0].name, "CONVEYOR BELT ASSEMBLY");
    });
    test("Lista de Locais", () async {
      await controller.getLocations("662fd0ee639069143a8fc387");
      var locations = controller.locations;
      expect(locations[0].name, "CHARCOAL STORAGE SECTOR");
    });
    test("Construção da arvore", () async {
      await controller.fetchAll("662fd0ee639069143a8fc387");
      var root = controller.root;
      expect(root.children[0].name, "Empty Machine house");
    });
  });
}
