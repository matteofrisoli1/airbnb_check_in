import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String supabaseUrl = 'https://fwhsnlwssxahswhkzact.supabase.co';
  static const String supabaseAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ3aHNubHdzc3hhaHN3aGt6YWN0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI1NjI2NjQsImV4cCI6MjA0ODEzODY2NH0.6JAM63dquAwK_fIkWCSPzcJSXZAFQlbHKwVu8yLkRRY';

  static Future<void> initialize() async {
    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  }
}
