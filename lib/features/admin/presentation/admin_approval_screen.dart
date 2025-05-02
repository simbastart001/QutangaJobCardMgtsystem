import 'package:flutter/material.dart';
import '../../../data/local/job_card_db.dart';

class AdminApprovalScreen extends StatefulWidget {
  const AdminApprovalScreen({super.key});

  @override
  State<AdminApprovalScreen> createState() => _AdminApprovalScreenState();
}

class _AdminApprovalScreenState extends State<AdminApprovalScreen> {
  final _db = AppDatabase();
  late Future<List<JobCard>> _jobCardsFuture;

  @override
  void initState() {
    super.initState();
    _loadJobCards();
  }

  void _loadJobCards() {
    _jobCardsFuture = _db.getAllJobCards();
  }

  Future<void> _handleAction(JobCard card, String status) async {
    final commentController = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('$status Job Card'),
        content: TextField(
          controller: commentController,
          decoration: const InputDecoration(hintText: 'Enter comment'),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, commentController.text),
            child: const Text('Submit'),
          ),
        ],
      ),
    );

    if (result != null) {
      await _db.updateStatus(card.jobid, status, result);
      setState(() => _loadJobCards());
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return Colors.green.shade100;
      case 'rejected':
        return Colors.red.shade100;
      case 'pending':
        return Colors.yellow.shade100;
      default:
        return Colors.grey.shade100;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return Icons.check_circle;
      case 'rejected':
        return Icons.cancel;
      case 'pending':
        return Icons.hourglass_top;
      default:
        return Icons.help_outline;
    }
  }

  Color _getStatusBadgeColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  Widget _buildCard(JobCard card) {
    return Card(
      color: _getStatusColor(card.status),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Icon(
          _getStatusIcon(card.status),
          color: _getStatusBadgeColor(card.status),
          size: 32,
        ),
        title: Text(card.title,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text('Client: ${card.clientname}'),
            Text('Technician: ${card.technician}'),
            const SizedBox(height: 4),
            Row(
              children: [
                Chip(
                  label: Text(card.status),
                  backgroundColor:
                      _getStatusBadgeColor(card.status).withOpacity(0.2),
                  labelStyle: TextStyle(
                    color: _getStatusBadgeColor(card.status),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            if (card.admincomment != null && card.admincomment!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text('Comment: ${card.admincomment}'),
              ),
          ],
        ),
        trailing: card.status.toLowerCase() == 'pending'
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.check, color: Colors.green),
                    onPressed: () => _handleAction(card, 'Approved'),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.red),
                    onPressed: () => _handleAction(card, 'Rejected'),
                  ),
                ],
              )
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: const Text("Admin Approval"), centerTitle: true),
      body: FutureBuilder<List<JobCard>>(
        future: _jobCardsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load data.'));
          }

          final cards = snapshot.data ?? [];
          if (cards.isEmpty) {
            return const Center(child: Text('No Job Cards found.'));
          }

          return ListView.builder(
            itemCount: cards.length,
            itemBuilder: (_, i) => _buildCard(cards[i]),
          );
        },
      ),
    );
  }
}
