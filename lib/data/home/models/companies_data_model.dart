import 'package:boycott_app/data/home/models/alternatives_model.dart';
import 'package:boycott_app/data/home/models/category_model.dart';
import 'package:boycott_app/data/home/models/logo_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'companies_data_model.g.dart';

@JsonSerializable()
@immutable
final class CompaniesDataModel {
  const CompaniesDataModel({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.website,
    required this.logo,
    required this.categories,
    required this.alternatives,
  });

  factory CompaniesDataModel.fromJson(Map<String, dynamic> json) => _$CompaniesDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompaniesDataModelToJson(this);

  final String? id;
  final String? name;
  final String? description;
  final String? type;
  final String? website;
  final LogoModel? logo;
  final List<CategoryModel>? categories;
  final List<AlternativesModel>? alternatives;
}
