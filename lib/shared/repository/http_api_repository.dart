import 'dart:convert';

import 'package:chalenge_tractian_app/shared/models/asset_model.dart';
import 'package:chalenge_tractian_app/shared/models/compane_model.dart';
import 'package:chalenge_tractian_app/shared/models/location_model.dart';
import 'package:chalenge_tractian_app/shared/repository/repository.dart';
import 'package:http/http.dart' as http;

class HttpApiRepository implements Repository {
  @override
  Future<List<AssetModel>> getAssets(String companieId) async {
    List<AssetModel> assets = [];
    var url =
        Uri.parse("https://fake-api.tractian.com/companies/$companieId/assets");
    var response = await http.get(url);
    var decodeResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    assets = decodeResponse.map((json) => AssetModel.fromJson(json)).toList();

    return assets;
  }

  @override
  Future<List<CompaneModel>> getCompanies() async {
    List<CompaneModel> companies = [];
    var url = Uri.parse("https://fake-api.tractian.com/companies");
    var response = await http.get(url);
    var decodeResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    companies =
        decodeResponse.map((json) => CompaneModel.fromJson(json)).toList();
    return companies;
  }

  @override
  Future<List<LocationModel>> getLocations(String companieId) async {
    List<LocationModel> locations = [];
    var url = Uri.parse(
        "https://fake-api.tractian.com/companies/$companieId/locations");
    var response = await http.get(url);
    var decodeResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    locations =
        decodeResponse.map((json) => LocationModel.fromJson(json)).toList();
    return locations;
  }
}
