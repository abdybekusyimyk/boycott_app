import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logo_model.g.dart';

@JsonSerializable()
@immutable
final class LogoModel {
  const LogoModel({required this.type, required this.url});

  factory LogoModel.fromJson(Map<String, dynamic> json) => _$LogoModelFromJson(json);

  Map<String, dynamic> toJson() => _$LogoModelToJson(this);

  final String? type;
  final String? url;
}
