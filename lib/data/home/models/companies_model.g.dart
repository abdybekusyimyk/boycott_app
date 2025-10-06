// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompaniesModel _$CompaniesModelFromJson(Map<String, dynamic> json) =>
    CompaniesModel(
      code: (json['code'] as num).toInt(),
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => CompaniesDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompaniesModelToJson(CompaniesModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };
