import 'package:car_rent/Presentation%20Layer/controller/car_delteal/cubit/car_deteail_dart_cubit.dart';
import 'package:car_rent/Data%20Layer/model/suggestions_model.dart';
import 'package:car_rent/server_locator.dart';
import 'package:car_rent/Presentation%20Layer/pages/car_delteal/car_delteal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_rent/Presentation%20Layer/controller/search/cubit/search_cubit.dart';
import 'package:car_rent/Presentation%20Layer/controller/search/cubit/search_state.dart';
import 'package:car_rent/Data%20Layer/model/car_model.dart';
import 'package:car_rent/core/constant/app_colors.dart';

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
              final cars = suggestions[index];

              return Card(
                child: ListTile(
                  title: Text(cars.carName ?? ''),
                  subtitle: Text(cars.category ?? ''),
                  trailing: Text(
                    cars.presPerDay.toString(),
                    style: TextStyle(
                      color: AppColors.successColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () async {
                    final CarModel carModel =
                        await searchCubit.getCarDetails(cars.carId ?? 0)
                            as CarModel;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) {
                            final cubit = sl<CarDeteailDartCubit>();
                            cubit.fetchReviews(cars.carId!);
                            return cubit;
                          },
                          child: CarDetailsPage(car: carModel),
                        ),
                      ),
                    );
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
              final SuggestionsModel car = results[index];

              return Card(
                child: ListTile(
                  title: Text(car.carName ?? ''),
                  subtitle: Text(car.category ?? ''),
                  trailing: Text(
                    car.presPerDay.toString(),
                    style: TextStyle(
                      color: AppColors.successColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () async {
                    final CarModel carModel =
                        await searchCubit.getCarDetails(car.carId ?? 0)
                            as CarModel;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) {
                            final cubit = sl<CarDeteailDartCubit>();
                            cubit.fetchReviews(car.carId!);
                            return cubit;
                          },
                          child: CarDetailsPage(car: carModel),
                        ),
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
