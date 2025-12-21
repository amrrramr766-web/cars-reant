import 'package:car_rent/data/Data%20Layer/repositories/booking_repository.dart';
import 'package:car_rent/data/Data%20Layer/repositories/car_repository.dart';
import 'package:car_rent/data/Data%20Layer/repositories/favorites_repository.dart';
import 'package:car_rent/Presentation%20Layer/pages/auth/cubit/login/cubit/login_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/booking/cubit/cubit/booking_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/car_delteal/cubit/cubit/car_deteail_dart_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/cars/cubit/cubit/cars_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/Favorites/cubit/cubit/fave_cubit.dart';
import 'package:car_rent/Presentation%20Layer/controller/search/cubit/search_cubit.dart';
import 'package:car_rent/Presentation%20Layer/controller/theme/cubit/theme_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:car_rent/core/class/crud.dart';
import 'package:car_rent/Presentation%20Layer/pages/home/cubit/cubit/home_cubit.dart';

import 'package:car_rent/data/Data%20Layer/Remote%20Data%20Sources/auth_remote_data_source.dart';
import 'package:car_rent/data/Data%20Layer/Local%20Data%20Sources/auth_local_data_source.dart';
import 'package:car_rent/data/Data%20Layer/Remote%20Data%20Sources/car_remote_data_source.dart';
import 'package:car_rent/data/Data%20Layer/Remote%20Data%20Sources/booking_remote_data_source.dart';
import 'package:car_rent/data/Data%20Layer/Remote%20Data%20Sources/favorites_remote_data_source.dart';
import 'package:car_rent/data/Data%20Layer/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton<Crud>(() => Crud());
  // Remote data sources
  sl.registerLazySingleton<CarRemoteDataSource>(
    () => CarRemoteDataSource(sl<Crud>()),
  );
  sl.registerLazySingleton<BookingRemoteDataSource>(
    () => BookingRemoteDataSource(sl<Crud>()),
  );
  sl.registerLazySingleton<FavoritesRemoteDataSource>(
    () => FavoritesRemoteDataSource(sl<Crud>(), sl<AuthLocalDataSource>()),
  );
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(sl<Crud>()),
  );

  // Local data sources
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sharedPreferences: sharedPreferences),
  );

  // Repositories (depend on the appropriate data sources)
  sl.registerLazySingleton<BookingRepository>(
    () => BookingRepository(sl<BookingRemoteDataSource>()),
  );
  sl.registerLazySingleton<CarRepository>(
    () => CarRepository(sl<CarRemoteDataSource>()),
  );
  sl.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepository(sl<FavoritesRemoteDataSource>()),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepository(sl<AuthRemoteDataSource>(), sl<AuthLocalDataSource>()),
  );

  // Cubits
  sl.registerFactory<HomeCubit>(
    () => HomeCubit(sl<CarRepository>(), sl<FavoritesRepository>()),
  );
  sl.registerFactory<CarsCubit>(() => CarsCubit(sl()));
  sl.registerFactory<FaveCubit>(() => FaveCubit(sl()));
  sl.registerFactory<SearchCubit>(() => SearchCubit(sl()));
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl(), sl()));
  sl.registerFactory<CarDeteailDartCubit>(
    () => CarDeteailDartCubit(sl<CarRepository>()),
  );
  sl.registerFactory<BookingCubit>(() => BookingCubit(sl<BookingRepository>()));
  sl.registerFactory<ThemeCubit>(() => ThemeCubit());
}
