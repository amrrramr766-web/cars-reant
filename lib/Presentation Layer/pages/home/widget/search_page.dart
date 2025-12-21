import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/Presentation%20Layer/pages/car_delteal/cubit/cubit/car_deteail_dart_cubit.dart';
import 'package:car_rent/data/Data%20Layer/model/suggestions_model.dart';
import 'package:car_rent/server_locator.dart';
import 'package:car_rent/Presentation%20Layer/pages/car_delteal/car_delteal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_rent/Presentation%20Layer/controller/search/cubit/search_cubit.dart';
import 'package:car_rent/Presentation%20Layer/controller/search/cubit/search_state.dart';
import 'package:car_rent/core/constant/app_colors.dart';

class SearchPage extends SearchDelegate<void> {
  final SearchCubit searchCubit;
  bool _initialized = false;

  SearchPage({required this.searchCubit});

  // ================= ACTIONS =================
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

  // ================= LEADING =================
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  // ================= RESULTS =================
  @override
  Widget buildResults(BuildContext context) {
    return const Center(
      child: Text(
        "اختر سيارة من النتائج",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  // ================= SUGGESTIONS =================
  @override
  Widget buildSuggestions(BuildContext context) {
    if (!_initialized) {
      _initialized = true;
      searchCubit.fetchSuggestions();
    }

    if (query.isNotEmpty) {
      searchCubit.fetchSearchResults(query);
    }

    return BlocBuilder<SearchCubit, SearchState>(
      bloc: searchCubit,
      builder: (context, state) {
        if (state is SearchSuggestionsLoading ||
            state is SearchResultsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (query.isEmpty && state is SearchSuggestionsLoaded) {
          return _buildSuggestions(state.suggestions);
        }

        if (query.isNotEmpty && state is SearchLoaded) {
          return _buildResults(state.searchResults);
        }

        if (state is SearchError) {
          return Center(child: Text(state.message));
        }

        return const Center(
          child: Text(
            "ابدأ بالبحث عن سيارة",
            style: TextStyle(color: Colors.grey),
          ),
        );
      },
    );
  }

  // ================= HELPERS =================
  Widget _buildSuggestions(List<SuggestionsModel> suggestions) {
    if (suggestions.isEmpty) {
      return const Center(
        child: Text("لا توجد اقتراحات", style: TextStyle(color: Colors.grey)),
      );
    }

    return ListView.separated(
      itemCount: suggestions.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final car = suggestions[index];
        return ListTile(
          title: Text(car.carName ?? ''),
          subtitle: Text(car.category ?? ''),
          onTap: () async {
            final carDetails = await searchCubit.getCarDetails(car.carId!);

            if (carDetails != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (_) => sl<CarDeteailDartCubit>(),
                    child: CarDetailsPage(car: carDetails),
                  ),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("تعذر جلب تفاصيل السيارة")),
              );
            }
          },
        );
      },
    );
  }

  Widget _buildResults(List<SuggestionsModel> results) {
    if (results.isEmpty) {
      return const Center(
        child: Text(
          "لا توجد نتائج مطابقة",
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final car = results[index];
        return ListTile(
          title: Text(car.carName ?? ''),
          subtitle: Text(car.category ?? ''),
          onTap: () async {
            final carDetails = await searchCubit.getCarDetails(car.id!);

            if (carDetails != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (_) => sl<CarDeteailDartCubit>(),
                    child: CarDetailsPage(car: carDetails),
                  ),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("تعذر جلب تفاصيل السيارة")),
              );
            }
          },
        );
      },
    );
  }
}
