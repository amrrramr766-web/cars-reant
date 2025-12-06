import 'package:bloc/bloc.dart';
import 'package:car_rent/data/data_source/remote/fave/fave_data.dart';
import 'package:car_rent/data/model/favor_cars_model.dart';

import 'package:equatable/equatable.dart';

part 'fave_state.dart';

class FaveCubit extends Cubit<FaveState> {
  final FaveData faveData;
  FaveCubit(this.faveData) : super(FaveInitial());

  List<FavorCarsModel> favorites = [];

  Future<void> getData(int userId) async {
    emit(FaveLoading());
    final response = await faveData.getFavoritesCars(userId);
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
    final result = await faveData.toggleFavorite(userId, carId);

    result.fold(
      (failure) {
        emit(AddFaveError(message: "Failed to update favorite"));
      },
      (success) async {
        // After API call, reload the entire favorites list
        await getData(userId);
      },
    );
  }
}
