import 'package:bloc_test/bloc_test.dart';
import 'package:car_rent/controller/fave/cubit/fave_cubit.dart';
import 'package:car_rent/data/data_source/remote/fave/fave_data.dart';
import 'package:car_rent/data/model/favor_cars_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock class for FaveData
class MockFaveData extends Mock implements FaveData {}

void main() {
  late MockFaveData mockFaveData;
  late FaveCubit faveCubit;

  // Sample test data
  final testUserId = 1;
  final mockFavorites = [
    FavorCarsModel(
      favoriteID: 1019,
      userID: 1,
      itemID: 13,
      createdAt: "2025-11-24T19:52:07.943",
      itemName: "Elantra 2021",
      pricePerDay: 55,
      isAvailable: true,
      imageURL: "https://example.com/elantra.jpg",
      gas: "Petrol",
      gear: "Automatic",
    ),
    FavorCarsModel(
      favoriteID: 19,
      userID: 1,
      itemID: 2,
      createdAt: "2025-11-23T08:54:00.337",
      itemName: "Camry 2022",
      pricePerDay: 65,
      isAvailable: true,
      imageURL: "https://example.com/camry.jpg",
      gas: "Petrol",
      gear: "Automatic",
    ),
  ];

  setUp(() {
    // Create fresh mocks before each test
    mockFaveData = MockFaveData();
    faveCubit = FaveCubit(mockFaveData);
  });

  tearDown(() {
    // Clean up after each test
    faveCubit.close();
  });

  group('FaveCubit', () {
    test('initial state is FaveInitial', () {
      expect(faveCubit.state, equals(FaveInitial()));
    });

    blocTest<FaveCubit, FaveState>(
      'emits [FaveLoading, FaveLoaded] when getData succeeds',
      build: () {
        // Mock successful API response
        when(
          () => mockFaveData.getFavoritesCars(testUserId),
        ).thenAnswer((_) async => Right(mockFavorites));
        return faveCubit;
      },
      act: (cubit) => cubit.getData(testUserId),
      expect: () => [FaveLoading(), FaveLoaded(favorites: mockFavorites)],
      verify: (_) {
        // Verify that the API was called with correct userId
        verify(() => mockFaveData.getFavoritesCars(testUserId)).called(1);
      },
    );

    test('favorites list is updated after successful getData', () async {
      // Arrange
      when(
        () => mockFaveData.getFavoritesCars(testUserId),
      ).thenAnswer((_) async => Right(mockFavorites));

      // Act
      await faveCubit.getData(testUserId);

      // Assert
      expect(faveCubit.favorites.length, equals(2));
      expect(faveCubit.favorites[0].itemName, equals("Elantra 2021"));
      expect(faveCubit.favorites[1].itemName, equals("Camry 2022"));
    });
  });
}
