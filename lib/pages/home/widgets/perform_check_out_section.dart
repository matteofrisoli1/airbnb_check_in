import 'package:airbnb_checkin/models/booking/booking.dart';
import 'package:flutter/material.dart';

class PerformCheckOutSection extends StatelessWidget {
  final Booking booking;
  final GestureTapCallback? onTapCheckout;
  final GestureTapCallback? onTapSupport;

  const PerformCheckOutSection({
    super.key,
    required this.booking,
    this.onTapCheckout,
    this.onTapSupport,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    booking.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade900,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${booking.guestsCount} ospiti',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(booking.imageUrl),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.maxFinite,
          child: ElevatedButton(
            onPressed: onTapCheckout,
            child: const Text('Check-Out'),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.maxFinite,
          child: OutlinedButton(
            onPressed: onTapSupport,
            child: const Text('Chat'),
          ),
        ),
      ],
    );
  }
}
