import 'package:bloc/bloc.dart';
import 'package:car_rent/data/data_source/remote/fave/fave_data.dart';
import 'package:car_rent/data/model/FavoriteModel.dart';
import 'package:equatable/equatable.dart';

part 'fave_state.dart';

class FaveCubit extends Cubit<FaveState> {
  final FaveData faveData;
  FaveCubit(this.faveData) : super(FaveInitial());

  List<FavoriteModel> favorites = [];

  Future<void> getData(int userId) async {
    emit(FaveLoading());
    final response = await faveData.getFavorites(userId);
    response.fold(
      (l) => emit(const FaveError(message: "Error fetching favorites")),
      (r) {
        favorites = r;
        emit(FaveLoaded(favorites: List.from(favorites)));
        print("Favorites: ${favorites.length}");
      },
    );
  }

  Future<void> addFave(int userId, int carId) async {
    // إضافة مؤقتة (Optimistic update)
    favorites.add(
      FavoriteModel(
        favoriteID: 0,
        userID: userId,
        itemID: carId,
        createdAt: DateTime.now().toString(),
      ),
    );

    emit(FaveLoaded(favorites: List.from(favorites)));

    // استدعاء API
    final result = await faveData.addFavorite(userId, carId);

    result.fold(
      (failure) {
        // إلغاء الإضافة المؤقتة في حالة الفشل
        favorites.removeWhere((f) => f.itemID == carId);

        emit(AddFaveError(message: "Failed to add favorite"));
        emit(FaveLoaded(favorites: List.from(favorites)));
      },
      (success) {
        // إذا تريد تحدّث favoriteID من السيرفر، ممكن هنا
      },
    );
  }

  Future<void> removeFave(int favoriteId) async {
    // إزالة مؤقتة (Optimistic update)
    favorites.removeWhere((f) => f.favoriteID == favoriteId);
    emit(FaveLoaded(favorites: List.from(favorites)));

    // استدعاء API
    final result = await faveData.deleteFavorite(favoriteId);

    result.fold(
      (failure) {
        emit(AddFaveError(message: "Failed to remove favorite"));
        emit(FaveLoaded(favorites: List.from(favorites)));
      },
      (success) {
        emit(RemoveFaveSuccess());
      },
    );
  }

  Future<bool> isFavorited(int carId) async {
    return favorites.any((f) => f.itemID == carId);
  }
}
