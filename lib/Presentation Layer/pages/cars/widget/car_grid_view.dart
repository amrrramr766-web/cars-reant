import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/Presentation%20Layer/pages/cars/cubit/cubit/cars_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/cars/widget/car_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CarGridView extends StatefulWidget {
  final String selectedType;
  final bool isDark;

  const CarGridView({
    super.key,
    required this.selectedType,
    required this.isDark,
  });

  @override
  State<CarGridView> createState() => _CarGridViewState();
}

class _CarGridViewState extends State<CarGridView> {
  late final _pagingController = PagingController<int, CarEntity>(
    getNextPageKey: (state) =>
        state.lastPageIsEmpty ? null : state.nextIntPageKey,
    fetchPage: (pageKey) => context.read<CarsCubit>().fetchCarsPage(
      pageKey,
      brand: widget.selectedType == 'All' ? null : widget.selectedType,
    ),
  );
  @override
  void didUpdateWidget(covariant CarGridView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.selectedType != widget.selectedType) {
      _pagingController.refresh();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PagingListener(
    controller: _pagingController,
    builder: (context, state, fetchNextPage) => PagedSliverList<int, CarEntity>(
      state: state,
      fetchNextPage: fetchNextPage,
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: (context, item, index) => CarItemCard(
          car: item,
          reversed: index.isEven,
          isDark: widget.isDark,
        ),
      ),
    ),
  );
}
