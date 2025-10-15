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

  @override
  Future<CompaniesModel> searchCompanies(String query) async {
    try {
      final encodedQuery = Uri.encodeComponent(query);

      final res = await dio.get(
        '/search/$encodedQuery',

        options: Options(
          headers: {'accept': 'application/json'},
          validateStatus: (status) {
            return status == 200 || status == 404;
          },
        ),
      );

      log('✅ SEARCH OK (Status: ${res.statusCode}): for query: $query');
      return CompaniesModel.fromJson(res.data);
    } on DioException catch (e) {
      log('🔥 Search Dio Error (Dio Status: ${e.response?.statusCode ?? 'N/A'}): $e');
      rethrow;
    } catch (e) {
      log('🔥 General Search Error: $e');
      rethrow;
    }
  }
}
