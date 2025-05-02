import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../../data/local/job_card_db.dart';

class JobCardSyncButton extends StatefulWidget {
  const JobCardSyncButton({super.key});

  @override
  State<JobCardSyncButton> createState() => _JobCardSyncButtonState();
}

class _JobCardSyncButtonState extends State<JobCardSyncButton> {
  bool _isSyncing = false;

  Future<void> _syncJobCards() async {
    setState(() => _isSyncing = true);
    debugPrint("===== Starting JobCard Sync Process =====");

    try {
      final db = AppDatabase();

      final jobCards = await db.getUnsyncedJobCards();
      debugPrint("===== Found ${jobCards.length} unsynced job cards to sync.");

      for (final card in jobCards) {
        final payload = {
          "jobid": card.jobid,
          "title": card.title,
          "clientname": card.clientname,
          "description": card.description,
          "technician": card.technician,
          "estimateddate": card.estimateddate.toIso8601String(),
          "status": card.status,
          "admincomment": card.admincomment,
        };

        final checkUrl =
            'http://192.168.255.27:8089/api/jobcards/${card.jobid}';
        bool syncSuccessful = false;

        try {
          final checkResponse = await http
              .get(Uri.parse(checkUrl))
              .timeout(const Duration(seconds: 5));

          if (checkResponse.statusCode == 200) {
            debugPrint(
                "===== Updating existing JobCard ID ${card.jobid} (PUT)");
            final response = await http
                .put(
                  Uri.parse(checkUrl),
                  headers: {'Content-Type': 'application/json'},
                  body: jsonEncode(payload),
                )
                .timeout(const Duration(seconds: 5));

            syncSuccessful =
                response.statusCode >= 200 && response.statusCode < 300;
          } else {
            debugPrint("===== Creating new JobCard ID ${card.jobid} (POST)");
            final postResponse = await http
                .post(
                  Uri.parse('http://192.168.255.27:8089/api/jobcards'),
                  headers: {'Content-Type': 'application/json'},
                  body: jsonEncode(payload),
                )
                .timeout(const Duration(seconds: 5));

            syncSuccessful =
                postResponse.statusCode >= 200 && postResponse.statusCode < 300;
          }

          if (syncSuccessful) {
            await db.markAsSynced(card.jobid);
            debugPrint("===== JobCard ID ${card.jobid} marked as synced");
          }
        } catch (e) {
          debugPrint("===== ❗ Error syncing JobCard ID ${card.jobid}: $e");
        }
      }

      if (jobCards.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Synced ${jobCards.length} job cards"),
              backgroundColor: Colors.green),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text("No job cards to sync"),
              backgroundColor: Colors.blue),
        );
      }
    } catch (e) {
      debugPrint("===== ❗ Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Sync failed: $e"), backgroundColor: Colors.red),
      );
    }

    debugPrint("===== JobCard Sync Process Complete =====");
    setState(() => _isSyncing = false);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: _isSyncing ? null : _syncJobCards,
      icon: _isSyncing
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
          : const Icon(Icons.sync),
      label: Text(_isSyncing ? "Syncing..." : "Sync"),
    );
  }
}
