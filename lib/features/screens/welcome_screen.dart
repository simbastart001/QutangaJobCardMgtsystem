import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qutanga_app/features/navigation/navigation_controller.dart';
import 'package:http/http.dart' as http;
import 'package:qutanga_app/widgets/job_card_sync_button.dart';

import '../../data/local/job_card_db.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = AppDatabase();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'QUTANGA APP',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.engineering, size: 80, color: Colors.green),
            const SizedBox(height: 20),
            const Text(
              'QUTANGA JOB CARD MANAGEMENT',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Manage job cards, approvals, reports and more.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            //
            const JobCardSyncButton()
            //
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Switch to the "Create" tab (index 2)
          ref.read(navigationIndexProvider.notifier).state = 1;
        },
        icon: const Icon(Icons.add),
        label: const Text('Create Job Card'),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
