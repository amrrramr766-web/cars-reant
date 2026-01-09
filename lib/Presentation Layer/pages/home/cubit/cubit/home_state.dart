part of 'home_cubit.dart';

enum HomeStatus { initial, loading, success, failure, networkFailure }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<CarEntity> cars;
  final List<String> brands;
  final List<String> categories;
  final List<CarEntity> carsByBrand;
  final List<OfferModel> offers;
  final int currentPage;
  final bool isFetching;
  final bool hasReachedMax;
  final String? errorMessage;

  const HomeState({
    required this.status,
    required this.cars,
    required this.brands,
    required this.categories,
    required this.carsByBrand,
    required this.offers,
    required this.currentPage,
    required this.isFetching,
    required this.hasReachedMax,
    this.errorMessage,
  });

  factory HomeState.initial() {
    return const HomeState(
      status: HomeStatus.initial,
      cars: [],
      brands: [],
      categories: [],
      carsByBrand: [],
      offers: [],
      currentPage: 1,
      isFetching: false,
      hasReachedMax: false,
    );
  }

  HomeState copyWith({
    HomeStatus? status,
    List<CarEntity>? cars,
    List<String>? brands,
    List<String>? categories,
    List<CarEntity>? carsByBrand,
    List<OfferModel>? offers,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      cars: cars ?? this.cars,
      brands: brands ?? this.brands,
      categories: categories ?? this.categories,
      carsByBrand: carsByBrand ?? this.carsByBrand,
      offers: offers ?? this.offers,
      currentPage: currentPage,
      isFetching: isFetching,
      hasReachedMax: hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    cars,
    brands,
    categories,
    carsByBrand,
    offers,
    errorMessage,
  ];
}
