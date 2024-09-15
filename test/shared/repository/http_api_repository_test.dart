import 'package:challenge_tractian_app/shared/models/asset_model.dart';
import 'package:challenge_tractian_app/shared/models/compane_model.dart';
import 'package:challenge_tractian_app/shared/models/location_model.dart';
import 'package:challenge_tractian_app/shared/repository/http_api_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  final repository = HttpApiRepository();
  List<CompanyModel> companies = await repository.getCompanies();
  List<AssetModel> assets = await repository.getAssets("662fd0ee639069143a8fc387");
  List<LocationModel> locations = await repository.getLocations("662fd0ee639069143a8fc387");
  print(companies[0].name);
  print(assets[0].name);
  print(locations[0].name);
}
