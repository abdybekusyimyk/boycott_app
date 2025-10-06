// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompaniesDataModel _$CompaniesDataModelFromJson(Map<String, dynamic> json) =>
    CompaniesDataModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      website: json['website'] as String?,
      logo: json['logo'] == null
          ? null
          : LogoModel.fromJson(json['logo'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      alternatives: (json['alternatives'] as List<dynamic>?)
          ?.map((e) => AlternativesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompaniesDataModelToJson(CompaniesDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'website': instance.website,
      'logo': instance.logo,
      'categories': instance.categories,
      'alternatives': instance.alternatives,
    };
