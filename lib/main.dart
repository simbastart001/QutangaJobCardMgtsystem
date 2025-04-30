import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:qutanga_app/features/job_card/presentation/job_card_creation_screen.dart';
import 'package:qutanga_app/features/admin/presentation/admin_approval_screen.dart';
import 'package:qutanga_app/features/reports/presentation/reports_screen.dart';

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
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    JobCardCreationScreen(),
    AdminApprovalScreen(),
    ReportsScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Create'),
          BottomNavigationBarItem(
              icon: Icon(Icons.admin_panel_settings), label: 'Admin'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: 'Reports'),
        ],
      ),
    );
  }
}
