import 'package:car_rent/core/class/crud.dart';
import 'package:car_rent/core/class/states_request.dart';
import 'package:dartz/dartz.dart';
import 'package:car_rent/link_api.dart';

class FavoritesRemoteDataSource {
  final Crud crud;

  FavoritesRemoteDataSource(this.crud);

  Future<Either<StatusRequest, dynamic>> toggleFavorite({
    required int userId,
    required int carId,
  }) async {
    return await crud.postData(LinkApi.toggleFavorite, {
      "userID": userId,
      "carID": carId,
    });
  }

  Future<Either<StatusRequest, dynamic>> getFavorites(int userId) async {
    return await crud.getData("${LinkApi.getFavoritesByUser}/$userId");
  }
}
