import 'package:flutter/material.dart';

class RentalCard extends StatelessWidget {
  final String status;
  final String title;
  final DateTime? startDate;
  final DateTime? endDate;
  final Color statusColor;
  final String buttonText;
  final Color buttonColor;
  final Color textColor;

  const RentalCard({
    super.key,
    required this.status,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.statusColor,
    required this.buttonText,
    required this.buttonColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF101C22) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: isDark ? Border.all(color: Colors.grey[700]!) : null,
        boxShadow: [
          if (!isDark)
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Text Section
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    letterSpacing: 1.1,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.grey[200] : const Color(0xFF212529),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  startDate != null && endDate != null
                      ? "${startDate!.month}-${startDate!.day}-${startDate!.year} - ${endDate!.month}-${endDate!.day}-${endDate!.year}"
                      : "Date not available",
                  style: TextStyle(
                    color: isDark ? Colors.grey[400] : const Color(0xFF6C757D),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    minimumSize: const Size(84, 32),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Image
          /*   Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
