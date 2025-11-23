import 'package:car_rent/core/class/crud.dart';
import 'package:car_rent/core/class/states_request.dart';
import 'package:car_rent/data/model/FavoriteModel.dart';
import 'package:car_rent/link_api.dart';
import 'package:dartz/dartz.dart';

class FaveData {
  final Crud crud;
  FaveData(this.crud);

  // ------------------------- GET FAVORITES --------------------------
  Future<Either<StatusRequest, List<FavoriteModel>>> getFavorites(
    int userId,
  ) async {
    print("🔵 [FaveData] getFavorites() CALLED");
    print("➡️  Endpoint: ${LinkApi.getFavoritesByUser}/$userId");

    var response = await crud.getData("${LinkApi.getFavoritesByUser}/$userId");

    print("📥 [Response Raw]: $response");

    return response.fold(
      (l) {
        print("❌ [FaveData] getFavorites() FAILED: $l");
        return Left(l);
      },
      (r) {
        print("✅ [FaveData] getFavorites() SUCCESS");
        print("📦 [Data]: $r");

        if (r is List) {
          final favorites = r.map((e) => FavoriteModel.fromJson(e)).toList();
          print("🟢 Parsed FavoriteModel List Count: ${favorites.length}");
          return Right(favorites);
        } else {
          print("❌ [FaveData] getFavorites() Response was not a list");
          return const Left(StatusRequest.failure);
        }
      },
    );
  }

  // ------------------------- ADD FAVORITE --------------------------
  Future<Either<StatusRequest, dynamic>> addFavorite(
    int userId,
    int carId,
  ) async {
    print("🔵 [FaveData] addFavorite() CALLED");
    print("➡️ Endpoint: ${LinkApi.addFavorite}");
    print("📤 Body: { userID: $userId, itemID: $carId }");

    var response = await crud.postData(LinkApi.addFavorite, {
      "userID": userId,
      "itemID": carId,
    });

    print("📥 [Response Raw]: $response");

    return response.fold(
      (l) {
        print("❌ [FaveData] addFavorite() FAILED: $l");
        return Left(l);
      },
      (r) {
        print("✅ [FaveData] addFavorite() SUCCESS");
        print("📦 [Data]: $r");
        return Right(r);
      },
    );
  }

  // ------------------------- DELETE FAVORITE --------------------------
  Future<Either<StatusRequest, dynamic>> deleteFavorite(int favoriteId) async {
    print("🔵 [FaveData] deleteFavorite() CALLED");
    print("➡️ Endpoint: ${LinkApi.deleteFavorite}$favoriteId");

    var response = await crud.postData(
      "${LinkApi.deleteFavorite}$favoriteId",
      {},
    );

    print("📥 [Response Raw]: $response");

    return response.fold(
      (l) {
        print("❌ [FaveData] deleteFavorite() FAILED: $l");
        return Left(l);
      },
      (r) {
        print("✅ [FaveData] deleteFavorite() SUCCESS");
        print("📦 [Data]: $r");
        return Right(r);
      },
    );
  }
}
