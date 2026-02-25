import 'package:fb_fitbody/core/constants/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> initializeSupabase() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Supabase.initialize(
      url: ApiConstants.supabaseUrl,
      anonKey: ApiConstants.anonKey,
    );
  } catch (e) {
    debugPrint('Failed to initialize Supabase: $e');
    rethrow;
  }
}
