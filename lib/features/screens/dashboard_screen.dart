import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_DashboardItem> items = [
      _DashboardItem(
        label: 'All Job Cards',
        icon: Icons.work_outline,
        color: Colors.blue,
        onTap: () {
          // TODO: Navigate to JobCardsListScreen
        },
      ),
      _DashboardItem(
        label: 'Reports',
        icon: Icons.pie_chart_outline,
        color: Colors.deepPurple,
        onTap: () {
          // TODO: Navigate to ReportsScreen
        },
      ),
      _DashboardItem(
        label: 'Approvals',
        icon: Icons.verified_user_outlined,
        color: Colors.orange,
        onTap: () {
          // TODO: Navigate to AdminApprovalScreen
        },
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (_, index) {
          final item = items[index];
          return GestureDetector(
            onTap: item.onTap,
            child: Card(
              elevation: 4,
              color: item.color.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item.icon, size: 40, color: item.color),
                  const SizedBox(height: 10),
                  Text(
                    item.label,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: item.color,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DashboardItem {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  _DashboardItem({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });
}
