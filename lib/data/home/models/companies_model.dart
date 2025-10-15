import 'package:boycott_app/data/home/models/companies_data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'companies_model.g.dart';

@JsonSerializable()
@immutable
final class CompaniesModel {
  const CompaniesModel({required this.code, required this.status, required this.data});

  factory CompaniesModel.fromJson(Map<String, dynamic> json) => _$CompaniesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompaniesModelToJson(this);
  final int code;
  final String status;
  final List<CompaniesDataModel> data;
}
