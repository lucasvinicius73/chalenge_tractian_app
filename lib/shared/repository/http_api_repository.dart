import 'package:chalenge_tractian_app/shared/models/asset_model.dart';
import 'package:chalenge_tractian_app/shared/models/compane_model.dart';
import 'package:chalenge_tractian_app/shared/models/location_model.dart';
import 'package:chalenge_tractian_app/shared/repository/repository.dart';

class HttpApiRepository implements Repository {
  @override
  Future<List<AssetModel>> getAssets(String companieId) {
    // TODO: implement getAssets
    throw UnimplementedError();
  }

  @override
  Future<List<CompaneModel>> getCompanies() {
    // TODO: implement getCompanies
    throw UnimplementedError();
  }

  @override
  Future<List<LocationModel>> getLocations(String companieId) {
    // TODO: implement getLocations
    throw UnimplementedError();
  }
  
}