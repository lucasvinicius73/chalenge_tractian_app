import 'dart:convert';

import 'package:challenge_tractian_app/shared/models/asset_model.dart';
import 'package:challenge_tractian_app/shared/models/compane_model.dart';
import 'package:challenge_tractian_app/shared/models/location_model.dart';
import 'package:challenge_tractian_app/shared/repository/repository.dart';
import 'package:http/http.dart';

class HttpApiRepository implements Repository {
  final Client client;

  HttpApiRepository({required this.client});

  @override
  Future<List<AssetModel>> getAssets(String companieId) async {
    List<AssetModel> assets = [];
    var url =
        Uri.parse("https://fake-api.tractian.com/companies/$companieId/assets");
    var response = await client.get(url);
    var decodeResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    assets = decodeResponse.map((json) => AssetModel.fromJson(json)).toList();

    return assets;
  }

  @override
  Future<List<CompanyModel>> getCompanies() async {
    List<CompanyModel> companies = [];
    var url = Uri.parse("https://fake-api.tractian.com/companies");
    var response = await client.get(url);
    var decodeResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    companies =
        decodeResponse.map((json) => CompanyModel.fromJson(json)).toList();
    return companies;
  }

  @override
  Future<List<LocationModel>> getLocations(String companieId) async {
    List<LocationModel> locations = [];
    var url = Uri.parse(
        "https://fake-api.tractian.com/companies/$companieId/locations");
    var response = await client.get(url);
    var decodeResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    locations =
        decodeResponse.map((json) => LocationModel.fromJson(json)).toList();
    return locations;
  }
}
