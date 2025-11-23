import 'package:car_rent/view/widget/booking%20widget/history/caed_list.dart';
import 'package:car_rent/view/widget/booking%20widget/history/rentals_tab_bar.dart';
import 'package:flutter/material.dart';

class BookingHistoryPage extends StatefulWidget {
  const BookingHistoryPage({super.key});

  @override
  State<BookingHistoryPage> createState() => _BookingHistoryPageState();
}

class _BookingHistoryPageState extends State<BookingHistoryPage> {
  int selectedIndex = 0; // start on "Current"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: RentalsTabBar(
          selectedIndex: selectedIndex, // ✅ FIXED
          onTabChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),

      body: CardList(showPast: selectedIndex == 1), // 1 = Past
    );
  }
}
