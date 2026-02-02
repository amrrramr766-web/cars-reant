import 'package:car_rent/data/Data%20Layer/Remote%20Data%20Sources/favorites_remote_data_source.dart';
import 'package:car_rent/data/Data%20Layer/model/car_model.dart';
import 'package:car_rent/data/Data%20Layer/model/favor_cars_model.dart';
import 'package:car_rent/Domain%20Layer/Repository%20Interfaces/i_favorites_repository.dart';
import 'package:car_rent/core/constant/erorr.dart';
import 'package:car_rent/data/Data%20Layer/model/extension/car_model_mapper.dart';
import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:dartz/dartz.dart';

class FavoritesRepository implements IFavoritesRepository {
  final FavoritesRemoteDataSource remoteDataSource;

  FavoritesRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, List<CarEntity>>> getFavoriteCars() async {
    var response = await remoteDataSource.getFavorites();

    return response.fold(
      (l) {
        return Left(
          ServerFailure('Unexpected response format: ${l.runtimeType}'),
        );
      },
      (r) {
        if (r is List) {
          final favorites = r.map((e) {
            try {
              if (e is Map) {
                final map = Map<String, dynamic>.from(e);
                final fav = FavorCarsModel.fromJson(map);
                var carModel = fav.toCarModel();

                // Some APIs use different keys for images (imageUrl, imageURL, image)
                final altImage =
                    (map['imageUrl'] ??
                            map['imageURL'] ??
                            map['image'] ??
                            map['image_url'])
                        ?.toString();
                if ((carModel.imageUrl == null || carModel.imageUrl!.isEmpty) &&
                    (altImage != null && altImage.isNotEmpty)) {
                  carModel = carModel.copyWith(imageUrl: altImage);
                }

                return carModel.toEntity();
              } else {
                // fallback: try to parse as CarModel shape
                return CarModel.fromJson(e).toEntity();
              }
            } catch (err) {
              // If parsing FavorCarsModel fails, fallback to CarModel parsing
              try {
                return CarModel.fromJson(e).toEntity();
              } catch (_) {
                // final fallback: return a minimal CarEntity
                return CarModel.fromJson({}).toEntity();
              }
            }
          }).toList();
          return Right(favorites);
        } else {
          return Left(
            ServerFailure('Unexpected response format: ${r.runtimeType}'),
          );
        }
      },
    );
  }

  @override
  Future<Either<Failure, dynamic>> toggleFavorite(int carId) async {
    var response = await remoteDataSource.toggleFavorite(carId: carId);

    return response.fold(
      (l) {
        return Left(
          ServerFailure('Unexpected response format: ${l.runtimeType}'),
        );
      },
      (r) {
        return Right(r);
      },
    );
  }
}
