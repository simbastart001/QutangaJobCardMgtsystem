import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qutanga_app/features/screens/dashboard_screen.dart';
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
      DashboardScreen(),
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
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Insights'),
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

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../features/admin/presentation/admin_approval_screen.dart';
// import '../features/job_card/presentation/job_card_creation_screen.dart';
// import '../features/reports/presentation/reports_screen.dart';
// import '../features/screens/dashboard_screen.dart';
// import '../features/screens/welcome_screen.dart';
//
// class MainNavigation extends StatefulWidget {
//   const MainNavigation({super.key});
//
//   @override
//   State<MainNavigation> createState() => _MainNavigationState();
// }
//
// class _MainNavigationState extends State<MainNavigation> {
//   final navigationIndexProvider = StateProvider<int>((ref) => 0);
//
//   int _selectedIndex = 0;
//
//   final List<Widget> _screens = const [
//     WelcomeScreen(),
//     DashboardScreen(),
//     JobCardCreationScreen(),
//     AdminApprovalScreen(),
//     ReportsScreen(),
//   ];
//
//   void _onTabTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   final List<BottomNavigationBarItem> _navItems = const [
//     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//     BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
//     BottomNavigationBarItem(
//         icon: Icon(Icons.add_circle_outline), label: 'Create'),
//     BottomNavigationBarItem(icon: Icon(Icons.verified_user), label: 'Admin'),
//     BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Reports'),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Colors.green,
//         unselectedItemColor: Colors.grey,
//         currentIndex: _selectedIndex,
//         onTap: _onTabTapped,
//         items: _navItems,
//       ),
//     );
//   }
// }
