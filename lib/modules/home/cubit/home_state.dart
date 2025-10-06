part of 'home_cubit.dart';

@immutable
sealed class HomeState {
  const HomeState();
}

@immutable
final class HomeInitial extends HomeState {
  const HomeInitial();
}

@immutable
final class HomeLoading extends HomeState {
  const HomeLoading();
}

@immutable
final class HomeSuccess extends HomeState {
  const HomeSuccess(this.companiesModel);

  final CompaniesModel companiesModel;
}

@immutable
final class HomeError extends HomeState {
  const HomeError(this.exception);

  final Object exception;
}
