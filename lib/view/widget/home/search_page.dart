import 'package:car_rent/view/pages/car_delteal/car_delteal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_rent/controller/search/cubit/search_cubit.dart';
import 'package:car_rent/controller/search/cubit/search_state.dart';
import 'package:car_rent/data/model/car_model.dart';

class SearchPage extends SearchDelegate {
  final SearchCubit searchCubit;

  SearchPage({required this.searchCubit});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          searchCubit.fetchSuggestions();
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  void showResults(BuildContext context) {
    searchCubit.fetchSearchResults(query);
    super.showResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      searchCubit.fetchSuggestions();
    } else {
      searchCubit.fetchSearchResults(query);
    }

    return BlocBuilder<SearchCubit, SearchState>(
      bloc: searchCubit,
      builder: (context, state) {
        if (state is SearchSuggestionsLoading ||
            state is SearchResultsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        // -------------------------
        //  Suggestions
        // -------------------------
        if (query.isEmpty && state is SearchSuggestionsLoaded) {
          final suggestions = state.suggestions;

          return ListView.builder(
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              final s = suggestions[index];

              return Card(
                child: ListTile(
                  title: Text(s.carName ?? ''),
                  onTap: () async {
                    final car = await searchCubit.getCarDetails(s.carId ?? 0);

                    if (car != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CarDetailsPage(car: car),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("تفاصيل السيارة غير متوفرة."),
                        ),
                      );
                    }
                  },
                ),
              );
            },
          );
        }

        // -------------------------
        //  Search Results
        // -------------------------
        if (query.isNotEmpty && state is SearchLoaded) {
          final results = state.searchResults;

          if (results.isEmpty) {
            return const Center(child: Text("لا توجد نتائج."));
          }

          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              final CarModel car = results[index];

              return Card(
                child: ListTile(
                  title: Text(car.brand ?? ''),
                  subtitle: Text(car.model ?? ''),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CarDetailsPage(car: car),
                      ),
                    );
                  },
                ),
              );
            },
          );
        }

        if (state is SearchError) {
          return Center(child: Text("خطأ: ${state.message}"));
        }

        return const SizedBox();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Center(child: Text("اضغط على نتيجة لفتح صفحة التفاصيل"));
  }
}
