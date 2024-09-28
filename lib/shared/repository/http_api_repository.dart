import 'dart:convert';
import 'dart:io';
import 'package:challenge_tractian_app/shared/states/states.dart';
import 'package:result_dart/result_dart.dart';
import 'package:challenge_tractian_app/shared/models/asset_model.dart';
import 'package:challenge_tractian_app/shared/models/compane_model.dart';
import 'package:challenge_tractian_app/shared/models/location_model.dart';
import 'package:challenge_tractian_app/shared/repository/repository.dart';
import 'package:http/http.dart';

class HttpApiRepository implements Repository {
  final Client client;

  HttpApiRepository({required this.client});

  @override
  AsyncResult<List<AssetModel>, StateModel> getAssets(String companieId) async {
    List<AssetModel> assets = [];
    var url =
        Uri.parse("https://fake-api.tractian.com/companies/$companieId/assets");
    try {
      var response = await client.get(url);
      if (response.statusCode == 500) {
        return Failure(Error(error: "Status 500: Erro interno na API "));
      } else if (response.statusCode == 200) {
        var decodeResponse =
            jsonDecode(utf8.decode(response.bodyBytes)) as List;
        assets =
            decodeResponse.map((json) => AssetModel.fromJson(json)).toList();
        return Success(assets);
      } else {
        return Failure(Error(error: "Erro inesperado"));
      }
    } on SocketException catch (e) {
      return Failure(Error(error: "Sem conexão com a internet"));
    } catch (e) {
      return Failure(Error(error: "Erro inesperado"));
    }
  }

  @override
  AsyncResult<List<CompanyModel>, StateModel> getCompanies() async {
    List<CompanyModel> companies = [];
    var url = Uri.parse("https://fake-api.tractian.com/companies");
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var decodeResponse =
            jsonDecode(utf8.decode(response.bodyBytes)) as List;
        companies =
            decodeResponse.map((json) => CompanyModel.fromJson(json)).toList();
        return Success(companies);
      }
      if (response.statusCode == 500) {
        return Failure(Error(error: "Status 500: Erro interno na API "));
      } else {
        return Failure(Error(error: "Erro inesperado"));
      }
    } on SocketException catch (e) {
      return Failure(Error(error: "Sem conexão com a internet"));
    }
  }

  @override
  AsyncResult<List<LocationModel>, StateModel> getLocations(
      String companieId) async {
    List<LocationModel> locations = [];
    var url = Uri.parse(
        "https://fake-api.tractian.com/companies/$companieId/locations");
    try {
      var response = await client.get(url);

      if (response.statusCode == 200) {
        var decodeResponse =
            jsonDecode(utf8.decode(response.bodyBytes)) as List;
        locations =
            decodeResponse.map((json) => LocationModel.fromJson(json)).toList();
        return Success(locations);
      }
      if (response.statusCode == 500) {
        return Failure(Error(error: "Status 500: Erro interno na API "));
      } else {
        return Failure(Error(error: "Erro inesperado"));
      }
    } on SocketException catch (e) {
      return Failure(Error(error: "Sem conexão com a internet"));
    }
  }
}
