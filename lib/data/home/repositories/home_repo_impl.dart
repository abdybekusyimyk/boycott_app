import 'package:boycott_app/data/home/models/companies_model.dart';
import 'package:boycott_app/data/home/repositories/home_repository.dart';
import 'package:boycott_app/data/home/sources/home_data_source.dart';
import 'package:flutter/foundation.dart';

@immutable
final class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl({required this.dataSource});

  final HomeDataSource dataSource;

  @override
  Future<CompaniesModel> getCompanies() async {
    final data = await dataSource.getCompanies();
    return data;
  }
}
