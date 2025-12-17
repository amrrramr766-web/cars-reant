import 'package:car_rent/Data%20Layer/Remote%20Data%20Sources/favorites_remote_data_source.dart';
import 'package:car_rent/Domain%20Layer/Repository%20Interfaces/i_favorites_repository.dart';
import 'package:car_rent/core/constant/erorr.dart';
import 'package:car_rent/Data%20Layer/model/car_model.dart';
import 'package:car_rent/link_api.dart';
import 'package:dartz/dartz.dart';

class FavoritesRepository implements IFavoritesRepository {
  final FavoritesRemoteDataSource remoteDataSource;

  FavoritesRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, List<CarModel>>> getFavoriteCars(int userId) async {
    if (userId <= 0) {
      print("⚠️ [FaveData] getFavorites() called with invalid userId: $userId");
      return Left(ServerFailure("Invalid user ID"));
    }
    print("🔵 [FaveData] getFavorites() CALLED");
    print("➡️  Endpoint: ${LinkApi.getFavoritesByUser}/$userId");

    var response = await remoteDataSource.getFavorites(userId);

    print("📥 [Response Raw]: $response");

    return response.fold(
      (l) {
        print("❌ [FaveData] getFavorites() FAILED: $l");
        return Left(
          ServerFailure('Unexpected response format: ${l.runtimeType}'),
        );
      },
      (r) {
        print("✅ [FaveData] getFavorites() SUCCESS");
        print("📦 [Data]: $r");

        if (r is List) {
          final favorites = r.map((e) => CarModel.fromJson(e)).toList();
          print("🟢 Parsed FavoriteModel List Count: ${favorites.length}");
          return Right(favorites);
        } else {
          print("❌ [FaveData] getFavorites() Response was not a list");
          return Left(
            ServerFailure('Unexpected response format: ${r.runtimeType}'),
          );
        }
      },
    );
  }

  @override
  Future<Either<Failure, dynamic>> toggleFavorite(int userId, int carId) async {
    print("🔵 [FaveData] toggleFavorite() CALLED");
    print("➡️ Endpoint: ${LinkApi.toggleFavorite}");
    print("📤 Body: { userID: $userId, itemID: $carId }");

    var response = await remoteDataSource.toggleFavorite(
      userId: userId,
      carId: carId,
    );

    print("📥 [Response Raw]: $response");

    return response.fold(
      (l) {
        print("❌ [FaveData] addFavorite() FAILED: $l");
        return Left(
          ServerFailure('Unexpected response format: ${l.runtimeType}'),
        );
      },
      (r) {
        print("✅ [FaveData] addFavorite() SUCCESS");
        print("📦 [Data]: $r");
        return Right(r);
      },
    );
  }
}
