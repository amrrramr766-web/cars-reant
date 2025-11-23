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
  final List<FavoriteModel> favorites;
  const FaveLoaded({required this.favorites});

  @override
  List<Object> get props => [favorites];
}

final class FaveEmpty extends FaveState {}

final class FaveError extends FaveState {
  final String message;
  const FaveError({required this.message});

  @override
  List<Object> get props => [message];
}

// ---- Add Favorite ----
final class AddFaveLoading extends FaveState {}

final class AddFaveSuccess extends FaveState {}

final class AddFaveError extends FaveState {
  final String message;
  const AddFaveError({required this.message});

  @override
  List<Object> get props => [message];
}

// ---- Remove Favorite (Optional) ----
final class RemoveFaveLoading extends FaveState {}

final class RemoveFaveSuccess extends FaveState {}

final class RemoveFaveError extends FaveState {
  final String message;
  const RemoveFaveError({required this.message});

  @override
  List<Object> get props => [message];
}
