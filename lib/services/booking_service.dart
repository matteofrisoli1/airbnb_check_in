import 'package:airbnb_checkin/models/booking/booking.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BookingService {
  final SupabaseClient supabase = Supabase.instance.client;

  BookingService();

  Future<Booking?> search(String pinCode) async {
    try {
      final response = await supabase
          .from('structures')
          .select('id, name, guests_count, image_url, pinCode')
          .eq('pinCode', pinCode)
          .single();

      final booking = Booking(
          id: response['id'],
          name: response['name'],
          guestsCount: response['guests_count'],
          imageUrl: response['image_url'],
          pinCode: pinCode,
          checkInTime: null,
          checkOutTime: null);

      return booking;
    } catch (_) {
      return null;
    }
  }
}
