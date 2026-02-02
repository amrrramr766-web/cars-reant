import 'package:car_rent/Presentation%20Layer/pages/booking/widget/booking_detail_item.dart';
import 'package:car_rent/Presentation%20Layer/pages/booking/widget/section_title.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingDetailsSection extends StatelessWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final Function(DateTime) onPickStart;
  final Function(DateTime) onPickEnd;

  const BookingDetailsSection({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.onPickStart,
    required this.onPickEnd,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('EEE, dd MMM');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle('Booking Details'),
        BookingDetailItem(
          icon: Icons.calendar_today,
          title: 'Pick-up',
          subtitle1: startDate != null
              ? formatter.format(startDate!)
              : 'Select Start Date',
          subtitle2: 'Choose location',
          onEdit: () async {
            final date = await _pickDate(context);
            if (date != null) onPickStart(date);
          },
        ),
        BookingDetailItem(
          icon: Icons.pin_drop,
          title: 'Drop-off',
          subtitle1: endDate != null
              ? formatter.format(endDate!)
              : 'Select End Date',
          subtitle2: 'Choose location',
          onEdit: () async {
            final date = await _pickDate(context);
            if (date != null) onPickEnd(date);
          },
        ),
      ],
    );
  }

  Future<DateTime?> _pickDate(BuildContext context) {
    final now = DateTime.now();
    return showDatePicker(
      context: context,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
      initialDate: now,
    );
  }
}
