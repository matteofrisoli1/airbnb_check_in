import 'package:airbnb_checkin/models/my_user/my_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient supabase = Supabase.instance.client;

  AuthService();

  Future<MyUser?> search(String email, String password) async {
    try {
      final response = await supabase.auth.signInWithPassword(email: email, password: password);

      if (response.user != null) {
        final myUser = MyUser(
          fullName: response.user!.email!,
          email: response.user!.email!,
          password: password,
        );

        return myUser;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
