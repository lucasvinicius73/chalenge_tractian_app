import 'package:challenge_tractian_app/shared/models/node_model.dart';

class LocationModel extends NodeModel {
  LocationModel(
      {required super.id,
      required super.name,
      required super.parentId,
      required super.locationId});

  factory LocationModel.fromJson(Map json) {
    return LocationModel(
      id: json["id"],
      name: json["name"],
      parentId: json["parentId"],
      locationId: json["locationId"],
    );
  }
}
