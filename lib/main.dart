import 'package:airbnb_checkin/app.dart';
import 'package:airbnb_checkin/config/supabase_config.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  try {
    await SupabaseConfig.initialize();
  } catch (_) {
    rethrow;
  }

  runApp(const App());
}
