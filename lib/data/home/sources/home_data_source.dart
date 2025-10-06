import 'package:boycott_app/data/home/models/companies_model.dart';

abstract interface class HomeDataSource {
  Future<CompaniesModel> getCompanies();
}
