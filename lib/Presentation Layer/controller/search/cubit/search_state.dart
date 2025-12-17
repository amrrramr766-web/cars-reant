import 'package:car_rent/Data%20Layer/model/suggestions_model.dart';
import 'package:equatable/equatable.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchResultsLoading extends SearchState {}

final class SearchSuggestionsLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  final List<SuggestionsModel> searchResults;
  const SearchLoaded({required this.searchResults});
  @override
  List<Object> get props => [searchResults];
}

final class SearchSuggestionsLoaded extends SearchState {
  final List<SuggestionsModel> suggestions;
  const SearchSuggestionsLoaded({required this.suggestions});
  @override
  List<Object> get props => [suggestions];
}

final class SearchError extends SearchState {
  final String message;
  const SearchError(this.message);
  @override
  List<Object> get props => [message];
}
