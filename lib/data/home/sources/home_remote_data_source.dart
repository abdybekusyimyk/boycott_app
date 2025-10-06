// import 'dart:developer';

// import 'package:boycott_app/data/home/models/home.dart';
// import 'package:boycott_app/data/home/sources/home_data_source.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';

// @immutable
// final class HomeRemoteDataSource implements HomeDataSource {
//   const HomeRemoteDataSource();

//   static const String baseUrl = 'https://api.boycottisraeli.biz/v1';

//   // @override
//   // Future<HomeModel> getHome() async {
//   //   try {
//   //     final dio = Dio(
//   //       BaseOptions(
//   //         baseUrl: baseUrl,
//   //         connectTimeout: const Duration(seconds: 10),
//   //         receiveTimeout: const Duration(seconds: 10),
//   //         headers: {'Accept': 'application/json'},
//   //       ),
//   //     );

//   //     final response = await dio.get('/companies', queryParameters: {'limit': 4, 'offset': 2});

//   //     if (response.statusCode == 200) {
//   //       log('✅ Response OK: ${response.statusCode}');
//   //       final data = response.data['data'] as List<dynamic>;
//   //       return HomeModel.fromJson({'companies': data});
//   //     } else {
//   //       log('⚠️ Error: ${response.statusCode}');
//   //       throw Exception('Failed to fetch data');
//   //     }
//   //   } on DioException catch (e, s) {
//   //     log('🔥 Dio error: ${e.message}\n$s');
//   //     rethrow;
//   //   } catch (e, s) {
//   //     log('🔥 Unknown error: $e\n$s');
//   //     rethrow;
//   //   }
//   // }
// }
