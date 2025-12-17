part of 'fave_cubit.dart';

sealed class FaveState extends Equatable {
  const FaveState();

  @override
  List<Object> get props => [];
}

final class FaveInitial extends FaveState {}

// ---- Fetch Favorites ----
final class FaveLoading extends FaveState {}

final class FaveLoaded extends FaveState {
  final List<FavorCarsModel> favorites;
  const FaveLoaded({required this.favorites});

  @override
  List<Object> get props => [favorites];
}

final class FaveError extends FaveState {
  final String message;
  const FaveError({required this.message});

  @override
  List<Object> get props => [message];
}

final class FaveCarsLoaded extends FaveState {
  final List<FavorCarsModel> faveCars;
  const FaveCarsLoaded({required this.faveCars});

  @override
  List<Object> get props => [faveCars];
}

// ---- Add Favorite ----

final class AddFaveError extends FaveState {
  final String message;
  const AddFaveError({required this.message});

  @override
  List<Object> get props => [message];
}
