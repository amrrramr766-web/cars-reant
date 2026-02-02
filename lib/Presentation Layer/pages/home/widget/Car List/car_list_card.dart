// PagedSliverList يتحكم بالتحميل الصفحي داخليًا
import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/Presentation%20Layer/pages/cars/cubit/cubit/cars_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/home/widget/Car%20List/car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CarListItems extends StatefulWidget {
  final bool isdark;
  const CarListItems({super.key, required this.isdark});

  @override
  State<CarListItems> createState() => _CarListItemsState();
}

class _CarListItemsState extends State<CarListItems> {
  late final _pagingController = PagingController<int, CarEntity>(
    getNextPageKey: (state) =>
        state.lastPageIsEmpty ? null : state.nextIntPageKey,
    fetchPage: (pageKey) => context.read<CarsCubit>().fetchCarsPage(pageKey),
  );

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
    builder: (context, state, fetchNextPage) =>
        PagedSliverList<int, CarEntity>.separated(
          state: state,
          fetchNextPage: fetchNextPage,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, item, index) =>
                CarCard(car: item, isdark: widget.isdark),
          ),
        ),
  );
}
