import 'package:bloc/bloc.dart';

import 'package:car_rent/data/Data%20Layer/repositories/favorites_repository.dart';
import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';

import 'package:equatable/equatable.dart';

part 'fave_state.dart';

class FaveCubit extends Cubit<FaveState> {
  final FavoritesRepository favoritesRepository;
  FaveCubit(this.favoritesRepository) : super(FaveInitial());

  List<CarEntity> favorites = [];

  Future<void> loadFavorites() async {
    emit(FaveLoading());
    final response = await favoritesRepository.getFavoriteCars();
    response.fold(
      (l) => emit(const FaveError(message: "Error fetching favorites")),
      (r) {
        favorites = r;
        emit(FaveLoaded(favorites: List.from(favorites)));
      },
    );
  }

  Future<void> toggleFave(int carId) async {
    final result = await favoritesRepository.toggleFavorite(carId);

    result.fold(
      (failure) {
        emit(AddFaveError(message: "Failed to update favorite"));
      },
      (success) async {
        // After API call, reload the entire favorites list
        await loadFavorites();
      },
    );
  }
}
