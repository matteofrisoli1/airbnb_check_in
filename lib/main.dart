import 'package:airbnb_checkin/app.dart';
import 'package:airbnb_checkin/config/supabase_config.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await SupabaseConfig.initialize();
  } catch (_) {
    rethrow;
  }

  runApp(const App());
}
