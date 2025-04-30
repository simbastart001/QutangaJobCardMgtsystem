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
      await _db.updateStatus(card.id, status, result);
      setState(() => _loadJobCards());
    }
  }

  Widget _buildCard(JobCard card) {
    return Card(
      child: ListTile(
        title: Text(card.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Client: ${card.clientName}'),
            Text('Technician: ${card.technician}'),
            Text('Status: ${card.status}'),
            if (card.adminComment != null)
              Text('Comment: ${card.adminComment}'),
          ],
        ),
        trailing: card.status == 'Pending'
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
      appBar: AppBar(title: const Text("Admin Approval")),
      body: FutureBuilder<List<JobCard>>(
        future: _jobCardsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load data.'));
          }

          final cards = snapshot.data ?? [];
          return ListView.builder(
            itemCount: cards.length,
            itemBuilder: (_, i) => _buildCard(cards[i]),
          );
        },
      ),
    );
  }
}
