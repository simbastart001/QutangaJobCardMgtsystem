import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qutanga_app/features/screens/welcome_screen.dart';
import 'package:qutanga_app/features/job_card/presentation/job_card_creation_screen.dart';
import 'package:qutanga_app/features/admin/presentation/admin_approval_screen.dart';
import 'package:qutanga_app/features/reports/presentation/reports_screen.dart';

import '../features/navigation/navigation_controller.dart';

class MainNavigation extends ConsumerWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationIndexProvider);
    final controller = ref.read(navigationIndexProvider.notifier);

    final List<Widget> screens = const [
      WelcomeScreen(),
      JobCardCreationScreen(),
      AdminApprovalScreen(),
      ReportsScreen(),
    ];

    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => controller.state = index,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
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
