import 'package:car_rent/data/model/car_model.dart';
import 'package:car_rent/view/widget/booking%20widget/confirm_booking-button.dart';
import 'package:car_rent/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingReviewPage extends StatefulWidget {
  final CarModel car;
  const BookingReviewPage({super.key, required this.car});

  @override
  State<BookingReviewPage> createState() => _BookingReviewPageState();
}

class _BookingReviewPageState extends State<BookingReviewPage> {
  DateTime? startDate;
  DateTime? endDate;
  int totalDays = 0;
  int? userId;

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getInt("userID") ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('EEE, dd MMM');
    double totalPrice = totalDays * widget.car.pricePerDay!;
    const taxesAndFees = 35.20;
    const cdw = 40.0;
    const gps = 15.0;
    double grandTotal = totalPrice + taxesAndFees + cdw + gps;

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.whiteWithOpacity(0.9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Review Your Booking",
          style: TextStyle(color: AppColors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ==== Car Details Card ====
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: Image.network(
                        widget.car.imageUrl!,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.car.model!,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Row(
                            children: [
                              const Icon(
                                Icons.group,
                                size: 18,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                "5 passengers",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 13.sp,
                                ),
                              ),
                              SizedBox(width: 16.w),
                              const Icon(
                                Icons.work,
                                size: 18,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                "2 large bags",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 13.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              /// ==== Booking Details ====
              Text(
                "Booking Details",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              _bookingDetailItem(
                icon: Icons.calendar_today,
                title: "Pick-up",
                subtitle1: startDate != null
                    ? dateFormatter.format(startDate!)
                    : "Select Start Date",
                subtitle2: "Choose location",
                onEdit: () async {
                  final picked = await _selectDate(context, startDate);
                  if (picked != null) {
                    setState(() => startDate = picked);
                    _recalculateDays();
                  }
                },
              ),
              _bookingDetailItem(
                icon: Icons.pin_drop,
                title: "Drop-off",
                subtitle1: endDate != null
                    ? dateFormatter.format(endDate!)
                    : "Select End Date",
                subtitle2: "Choose location",
                onEdit: () async {
                  final picked = await _selectDate(context, endDate);
                  if (picked != null) {
                    setState(() => endDate = picked);
                    _recalculateDays();
                  }
                },
              ),

              SizedBox(height: 20.h),

              /// ==== Price Summary ====
              Text(
                "Price Summary",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    children: [
                      _priceRow(
                        "Rental fee ($totalDays days x \$${widget.car.pricePerDay!.toStringAsFixed(2)})",
                        "\$${totalPrice.toStringAsFixed(2)}",
                      ),
                      _priceRow(
                        "Taxes & Fees",
                        "\$${taxesAndFees.toStringAsFixed(2)}",
                      ),
                      _priceRow(
                        "Collision Damage Waiver",
                        "\$${cdw.toStringAsFixed(2)}",
                      ),
                      _priceRow(
                        "GPS Navigation",
                        "\$${gps.toStringAsFixed(2)}",
                      ),
                      Divider(height: 20.h, color: AppColors.greyShades[400]),
                      _priceRow(
                        "Total Cost",
                        "\$${grandTotal.toStringAsFixed(2)}",
                        bold: true,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              /// ==== Rental Terms ====
              ExpansionTile(
                tilePadding: EdgeInsets.symmetric(horizontal: 8.w),
                title: const Text(
                  "Rental Terms & Conditions",
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "By proceeding, you agree to our rental agreement and cancellation policy. "
                      "Please review the full terms for details on mileage limits, fuel policy, "
                      "and potential additional charges. A security deposit will be held on your credit card upon pick-up.",
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      /// ==== Sticky Footer ====
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.whiteWithOpacity(0.9),
          border: Border(top: BorderSide(color: AppColors.greyShades[300]!)),
        ),
        child: ConfirmBookingButton(
          totalDays: totalDays,
          carId: widget.car.carID!,
          userId: userId ?? 0,
          startDate: startDate ?? DateTime.now(),
          endDate: endDate ?? DateTime.now(),
          totalPrice: grandTotal,
        ),
      ),
    );
  }

  void _recalculateDays() {
    if (startDate != null && endDate != null) {
      setState(() {
        totalDays = endDate!.difference(startDate!).inDays + 1;
      });
    }
  }

  Future<DateTime?> _selectDate(
    BuildContext context,
    DateTime? initialDate,
  ) async {
    final now = DateTime.now();
    return await showDatePicker(
      context: context,
      initialDate: initialDate ?? now,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
    );
  }

  Widget _bookingDetailItem({
    required IconData icon,
    required String title,
    required String subtitle1,
    required String subtitle2,
    required VoidCallback onEdit,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.only(bottom: 10.h),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.secondaryLight,
          child: Icon(icon, color: AppColors.secondaryColor),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitle1, style: TextStyle(color: AppColors.greyShades[700])),
            Text(
              subtitle2,
              style: TextStyle(color: AppColors.greyShades[600], fontSize: 12),
            ),
          ],
        ),
        trailing: TextButton(
          onPressed: onEdit,
          child: const Text(
            "Edit",
            style: TextStyle(color: AppColors.secondaryColor),
          ),
        ),
      ),
    );
  }

  Widget _priceRow(String label, String value, {bool bold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: AppColors.greyShades[700],
              fontSize: 13.sp,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
