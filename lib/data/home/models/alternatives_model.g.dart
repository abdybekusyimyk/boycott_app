// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alternatives_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlternativesModel _$AlternativesModelFromJson(Map<String, dynamic> json) =>
    AlternativesModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      website: json['website'] as String?,
      logo: json['logo'] == null
          ? null
          : LogoModel.fromJson(json['logo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AlternativesModelToJson(AlternativesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'website': instance.website,
      'logo': instance.logo,
    };
