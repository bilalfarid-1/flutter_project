import 'package:flutter/material.dart';

class PackageBookingCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final String bookingId;

  const PackageBookingCard({
    super.key,
    required this.data,
    required this.bookingId,
  });

  @override
  Widget build(BuildContext context) {
    final status = (data['status'] ?? '').toString().toLowerCase();
    final totalPrice = data['totalPrice'] ?? 0;
    final seats = data['seats'] ?? 1;
    final fromCity = (data['fromCity'] ?? '').toString();
    final toCity = (data['toCity'] ?? '').toString();
    final route = (fromCity.isNotEmpty && toCity.isNotEmpty)
        ? '$fromCity to $toCity'
        : 'Unknown Route';
    final userName = (data['userName'] ?? '').toString();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          // Nano Banana style: subtle warm shadow
          BoxShadow(
            color: const Color(0x22FFCC66),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    route,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                // Status badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: status == 'confirmed'
                        ? Colors.green.withOpacity(0.12)
                        : Colors.grey.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status == 'confirmed' ? 'Confirmed' : 'Pending',
                    style: TextStyle(
                      color: status == 'confirmed'
                          ? Colors.green
                          : Colors.grey[700],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'User: ${userName.isNotEmpty ? userName : 'Unknown User'}',
              style: TextStyle(color: Colors.grey[800]),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.payments, size: 18, color: Colors.black54),
                const SizedBox(width: 6),
                Text(
                  'Rs $totalPrice',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 16),
                const Icon(Icons.people, size: 18, color: Colors.black54),
                const SizedBox(width: 6),
                Text('$seats Seats'),
                const SizedBox(width: 24),
                const Icon(
                  Icons.credit_card_outlined,
                  size: 18,
                  color: Colors.black54,
                ),
                const SizedBox(width: 6),
                Text(data['paymentMethod'] ?? 'Cash'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
