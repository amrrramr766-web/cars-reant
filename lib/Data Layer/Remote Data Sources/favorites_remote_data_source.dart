import 'package:car_rent/Data%20Layer/Local%20Data%20Sources/auth_local_data_source.dart';
import 'package:car_rent/core/class/crud.dart';
import 'package:car_rent/core/class/states_request.dart';
import 'package:dartz/dartz.dart';
import 'package:car_rent/core/network/link_api.dart';

class FavoritesRemoteDataSource {
  final Crud crud;
  final AuthLocalDataSource authLocalDataSource;

  FavoritesRemoteDataSource(this.crud, this.authLocalDataSource);

  Future<Either<StatusRequest, dynamic>> toggleFavorite({
    required int carId,
  }) async {
    final userId = (await authLocalDataSource.getUser()).userID;

    return await crud.postData(
      LinkApi.toggleFavorite,
      null, // no body
      queryParameters: {
        'userId': userId,
        'itemId': carId, // MUST be itemId
      },
    );
  }

  Future<Either<StatusRequest, dynamic>> getFavorites() async {
    final userId = await authLocalDataSource.getUser().then((u) => u.userID);

    return await crud.getData("${LinkApi.getFavoritesByUser}$userId");
  }
}
