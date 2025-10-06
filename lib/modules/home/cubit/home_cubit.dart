import 'dart:developer';

import 'package:boycott_app/data/home/models/companies_model.dart';
import 'package:boycott_app/data/home/repositories/home_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repository) : super(const HomeInitial());

  final HomeRepository repository;

  Future<void> getCompanies() async {
    emit(const HomeLoading());
    try {
      final response = await repository.getCompanies();
      emit(HomeSuccess(response));
    } catch (e, s) {
      log('⚠️ HomeCubit -> getCompanies $e \n $s');
      emit(HomeError(e));
    }
  }
}
