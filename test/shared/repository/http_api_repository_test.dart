import 'dart:convert';

import 'package:challenge_tractian_app/shared/models/asset_model.dart';
import 'package:challenge_tractian_app/shared/models/compane_model.dart';
import 'package:challenge_tractian_app/shared/models/location_model.dart';
import 'package:challenge_tractian_app/shared/repository/http_api_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class HttpMock extends Mock implements Client {}

class ResponsepMock extends Mock implements Response {}

class FakeUri extends Fake implements Uri {}

void main() async {
  final client = HttpMock();
  final response = ResponsepMock();
  final repository = HttpApiRepository(client: client);
  setUpAll(
    () => registerFallbackValue(FakeUri()),
  );

  test("Get Companies any URL", () {
    when(() => client.get(any())).thenAnswer((_) async => response);
    when(() => response.bodyBytes).thenReturn(utf8.encode(companiesListString));

    expect(repository.getCompanies(), [
      CompanyModel(id: "662fd0ee639069143a8fc387", name: "Jaguar"),
      CompanyModel(id: "662fd0fab3fd5656edb39af5", name: "Tobias"),
      CompanyModel(id: "662fd100f990557384756e58", name: "Apex"),
    ]);
  });
  test("Get Companies on the real URL", () {
    expect(repository.getCompanies(), [
      CompanyModel(id: "662fd0fab3fd5656edb39af5", name: "Tobias"),
      CompanyModel(id: "662fd0ee639069143a8fc387", name: "Jaguar"),
      CompanyModel(id: "662fd100f990557384756e58", name: "Apex"),
    ]);
  });

  test("Get Companies on Error", () {});

  List<CompanyModel> companies = await repository.getCompanies();
  List<AssetModel> assets =
      await repository.getAssets("662fd0ee639069143a8fc387");
  List<LocationModel> locations =
      await repository.getLocations("662fd0ee639069143a8fc387");
  print(companies[0].name);
  print(assets[0].name);
  print(locations[0].name);
}

const companiesListString =
    """[{"id":"662fd0ee639069143a8fc387","name":"Jaguar"},{"id":"662fd0fab3fd5656edb39af5","name":"Tobias"},{"id":"662fd100f990557384756e58","name":"Apex"}]""";
