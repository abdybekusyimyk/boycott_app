import 'package:boycott_app/data/home/models/logo_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alternatives_model.g.dart';

@JsonSerializable()
@immutable
final class AlternativesModel {
  const AlternativesModel({
    required this.id,
    required this.name,
    required this.description,
    required this.website,
    required this.logo,
  });

  factory AlternativesModel.fromJson(Map<String, dynamic> json) => _$AlternativesModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlternativesModelToJson(this);

  final String? id;
  final String? name;
  final String? description;
  final String? website;
  final LogoModel? logo;
}
