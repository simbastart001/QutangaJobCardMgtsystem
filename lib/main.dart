import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qutanga_app/features/screens/splash_screen.dart';
import 'package:qutanga_app/widgets/main_navigation.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import 'data/local/job_card_db.dart';

// Create a provider for your database
final databaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(() => database.close());
  return database;
});

void main() async {
  // Ensure Flutter is initialized before using plugins
  WidgetsFlutterBinding.ensureInitialized();

  // Apply SQLite initialization workaround
  try {
    await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    print('***** SQLite workaround applied successfully');
  } catch (e) {
    print('***** Error applying SQLite workaround: $e');
  }

  // Run the app inside a ProviderScope to make the database accessible
  runApp(
    const ProviderScope(
      child: JobCardApp(),
    ),
  );
}

class JobCardApp extends StatelessWidget {
  const JobCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job Card System',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(),
    );
  }
}
