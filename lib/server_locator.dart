import 'package:car_rent/Data%20Layer/repositories/booking_repository.dart';
import 'package:car_rent/Data%20Layer/repositories/car_repository.dart';
import 'package:car_rent/Data%20Layer/repositories/favorites_repository.dart';
import 'package:car_rent/Presentation%20Layer/controller/auth/login/cubit/login_cubit.dart';
import 'package:car_rent/Presentation%20Layer/controller/bookin_cubit/cubit/booking_cubit.dart';
import 'package:car_rent/Presentation%20Layer/controller/car_delteal/cubit/car_deteail_dart_cubit.dart';
import 'package:car_rent/Presentation%20Layer/controller/cars/cubit/cars_cubit.dart';
import 'package:car_rent/Presentation%20Layer/controller/fave/cubit/fave_cubit.dart';
import 'package:car_rent/Presentation%20Layer/controller/search/cubit/search_cubit.dart';
import 'package:car_rent/Presentation%20Layer/controller/theme/cubit/theme_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:car_rent/core/class/crud.dart';
import 'package:car_rent/Presentation%20Layer/controller/home/cubit/home_cubit.dart';

import 'package:car_rent/Data Layer/Remote Data Sources/auth_remote_data_source.dart';
import 'package:car_rent/Data Layer/Local Data Sources/auth_local_data_source.dart';
import 'package:car_rent/Data Layer/Remote Data Sources/car_remote_data_source.dart';
import 'package:car_rent/Data Layer/Remote Data Sources/booking_remote_data_source.dart';
import 'package:car_rent/Data Layer/Remote Data Sources/favorites_remote_data_source.dart';
import 'package:car_rent/Data Layer/repositories/auth_repository.dart';
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
    () => FavoritesRemoteDataSource(sl<Crud>()),
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
  sl.registerFactory<HomeCubit>(() => HomeCubit(sl()));
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
