import 'package:equatable/equatable.dart';

class CompanyModel extends Equatable{
  final String id;
  final String name;

  CompanyModel({required this.id, required this.name});

  factory CompanyModel.fromJson(Map json) {
    return CompanyModel(id: json["id"], name: json["name"]);
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [id,name];
}
