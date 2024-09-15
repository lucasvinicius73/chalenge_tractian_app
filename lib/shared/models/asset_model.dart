import 'package:challenge_tractian_app/shared/models/node_model.dart';

class AssetModel extends NodeModel {
  final String? sensorId;
  final String? sensorType;
  final String? status;
  final String? gatewayId;

  AssetModel({
    required super.id,
    required super.name,
    required super.parentId,
    required super.locationId,
    required this.sensorId,
    required this.sensorType,
    required this.status,
    required this.gatewayId,
  });

  factory AssetModel.fromJson(Map json) {
    return AssetModel(
      id: json["id"],
      name: json["name"],
      parentId: json["parentId"],
      locationId: json["locationId"],
      sensorId: json["sensorId"],
      sensorType: json["sensorType"],
      status: json["status"],
      gatewayId: json["gatewayId"],
    );
  }
}
