import 'package:bloc/bloc.dart';
import 'package:car_rent/Data%20Layer/model/car_model.dart';
import 'package:car_rent/Data%20Layer/model/favor_cars_model.dart';
import 'package:car_rent/Data%20Layer/repositories/favorites_repository.dart';

import 'package:equatable/equatable.dart';

part 'fave_state.dart';

class FaveCubit extends Cubit<FaveState> {
  final FavoritesRepository favoritesRepository;
  FaveCubit(this.favoritesRepository) : super(FaveInitial());

  List<CarModel> favorites = [];

  Future<void> loadFavorites(int userId) async {
    emit(FaveLoading());
    final response = await favoritesRepository.getFavoriteCars(userId);
    response.fold(
      (l) => emit(const FaveError(message: "Error fetching favorites")),
      (r) {
        favorites = r;
        emit(FaveLoaded(favorites: List.from(favorites)));
        print("Favorites: ${favorites.length}");
      },
    );
  }

  Future<void> toggleFave(int userId, int carId) async {
    final result = await favoritesRepository.toggleFavorite(userId, carId);

    result.fold(
      (failure) {
        emit(AddFaveError(message: "Failed to update favorite"));
      },
      (success) async {
        // After API call, reload the entire favorites list
        await loadFavorites(userId);
      },
    );
  }
}
