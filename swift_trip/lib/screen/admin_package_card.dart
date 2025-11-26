import 'package:flutter/material.dart';
import 'package:swift_trip/screen/edit_package_screen.dart';

class AdminPackageCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final String docId;
  final Function(String docId, String packageName)? onDelete;

  const AdminPackageCard({
    super.key,
    required this.data,
    required this.docId,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final price = data['price'];
    final priceStr = price is num ? price.toString() : (price ?? '').toString();
    final title = (data['title'] ?? '').toString();
    final description = (data['description'] ?? '').toString();
    final seatsLeft = data['seatsLeft'] ?? data['seats_left'] ?? 0;
    final totalSeats = data['totalSeats'] ?? data['total_seats'] ?? 0;

    return Card(
      elevation: 2,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 12),

            // Details row
            Row(
              children: [
                Icon(
                  Icons.monetization_on_outlined,
                  size: 18,
                  color: Colors.grey[600],
                ),
                const SizedBox(width: 6),
                Text('\$' + priceStr),
                const SizedBox(width: 24),
                Icon(Icons.people_outline, size: 18, color: Colors.grey[600]),
                const SizedBox(width: 6),
                Text('Seats: ${seatsLeft}/${totalSeats}'),
              ],
            ),

            const SizedBox(height: 12),
            Divider(height: 1, thickness: 1, color: Colors.grey[200]),
            const SizedBox(height: 4),

            // Actions
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditPackageScreen(
                              packageId: docId,
                              currentData: data,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit_outlined),
                      label: const Text('Edit'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    width: 1,
                    thickness: 1,
                    color: Colors.grey[200],
                  ),
                  Expanded(
                    child: TextButton.icon(
                      onPressed: () {
                        if (onDelete != null) {
                          onDelete!(docId, title);
                        }
                      },
                      icon: const Icon(Icons.delete_outline),
                      label: const Text('Delete'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
