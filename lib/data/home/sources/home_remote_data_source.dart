import 'dart:developer';

import 'package:boycott_app/data/home/models/companies_model.dart';
import 'package:boycott_app/data/home/sources/home_data_source.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

@immutable
final class HomeRemoteDataSource implements HomeDataSource {
  const HomeRemoteDataSource(this.dio);

  final Dio dio;

  //! test code
  @override
  Future<CompaniesModel> getCompanies() async {
    try {
      final res = await dio.get(
        '/companies',
        // queryParameters: {'limit': 1, 'offset': 0},
        // options: Options(headers: {'accept': 'application/json'}),
      );
      if (res.statusCode == 200) {
        log('✅ OK: ${res.statusCode}');
        return CompaniesModel.fromJson(res.data);
      }
      throw Exception(' ⚠️ Failed: ${res.statusCode}');
    } catch (e) {
      log('🔥 Error: $e');
      rethrow;
    }
  }
}
