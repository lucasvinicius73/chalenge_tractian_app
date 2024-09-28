import 'package:challenge_tractian_app/shared/models/asset_model.dart';
import 'package:challenge_tractian_app/shared/models/compane_model.dart';
import 'package:challenge_tractian_app/shared/models/location_model.dart';
import 'package:challenge_tractian_app/shared/states/states.dart';
import 'package:result_dart/result_dart.dart';

abstract class Repository {
  AsyncResult<List<CompanyModel>, StateModel> getCompanies();
  AsyncResult<List<LocationModel>, StateModel> getLocations(String companieId);
  AsyncResult<List<AssetModel>, StateModel> getAssets(String companieId);
}
