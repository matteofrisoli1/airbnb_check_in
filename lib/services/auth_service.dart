import 'package:airbnb_checkin/models/my_user/my_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient supabase = Supabase.instance.client;

  AuthService();

  Future<MyUser?> search(String email, String password) async {
    try {
      final response = await supabase.auth.signInWithPassword(email: email, password: password);

      if (response.user != null) {
        final userId = response.user!.id;

        final profileResponse = await supabase
            .from('user_profiles')
            .select('first_name, last_name, profile_image_url')
            .eq('id', userId)
            .single();

        final myUser = MyUser(
          fullName: '${profileResponse['first_name']} ${profileResponse['last_name']}',
          email: response.user!.email!,
          password: password,
          imageUrl: profileResponse['profile_image_url'],
        );

        return myUser;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
