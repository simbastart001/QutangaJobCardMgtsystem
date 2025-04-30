import 'package:flutter/material.dart';
import 'features/job_card/presentation/job_card_creation_screen.dart';

// import 'features/admin/presentation/admin_approval_screen.dart';
// import 'features/reports/presentation/reports_screen.dart';

void main() {
  runApp(const JobCardApp());
}

class JobCardApp extends StatelessWidget {
  const JobCardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Card Management',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const JobCardCreationScreen(),
    );
  }
}
