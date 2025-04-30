import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../data/local/job_card_db.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  final _db = AppDatabase();
  DateTime? _startDate;
  DateTime? _endDate;

  late Future<List<JobCard>> _filteredCards;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() {
    _filteredCards = _db.getAllJobCards(); // Filtering logic can be added later
  }

  Widget _summary(List<JobCard> cards) {
    final total = cards.length;
    final approved = cards.where((e) => e.status == 'Approved').length;
    final rejected = cards.where((e) => e.status == 'Rejected').length;
    final pending = cards.where((e) => e.status == 'Pending').length;

    return Column(
      children: [
        _statTile("Total", total),
        _statTile("Approved", approved),
        _statTile("Rejected", rejected),
        _statTile("Pending", pending),
      ],
    );
  }

  Widget _statTile(String label, int value) {
    return ListTile(
      title: Text(label),
      trailing:
          Text('$value', style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Future<void> _pickDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
        // NOTE: To be implemented: filter data by date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('yyyy-MM-dd');

    return Scaffold(
      appBar: AppBar(title: const Text("Reports")),
      body: FutureBuilder<List<JobCard>>(
        future: _filteredCards,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final cards = snapshot.data ?? [];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ElevatedButton.icon(
                  onPressed: _pickDateRange,
                  icon: const Icon(Icons.filter_alt),
                  label: const Text('Filter by Date Range'),
                ),
                if (_startDate != null && _endDate != null)
                  Text(
                      'Filtered: ${formatter.format(_startDate!)} to ${formatter.format(_endDate!)}'),
                const SizedBox(height: 20),
                _summary(cards),
              ],
            ),
          );
        },
      ),
    );
  }
}
