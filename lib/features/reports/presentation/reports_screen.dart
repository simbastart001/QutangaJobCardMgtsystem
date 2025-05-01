import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
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
    _fetchData(); // Initially fetch all data
  }

  void _fetchData() {
    if (_startDate != null && _endDate != null) {
      _filteredCards = _db.getJobCardsByDateRange(_startDate!, _endDate!);
    } else {
      _filteredCards = _db.getAllJobCards();
    }
    setState(() {});
  }

  Future<void> _pickDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      _startDate = picked.start;
      _endDate = picked.end;
      _fetchData();
    }
  }

  Widget _summary(List<JobCard> cards) {
    final total = cards.length;
    final approved = cards.where((e) => e.status == 'Approved').length;
    final rejected = cards.where((e) => e.status == 'Rejected').length;
    final pending = cards.where((e) => e.status == 'Pending').length;

    final Map<String, double> dataMap = {
      "Approved": approved.toDouble(),
      "Rejected": rejected.toDouble(),
      "Pending": pending.toDouble(),
    };

    final colorList = <Color>[
      Colors.green,
      Colors.red,
      Colors.orange,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text(
          "Summary",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        _statTile("Total", total),
        _statTile("Approved", approved),
        _statTile("Rejected", rejected),
        _statTile("Pending", pending),
        const SizedBox(height: 20),
        if (total > 0)
          PieChart(
            dataMap: dataMap,
            animationDuration: const Duration(milliseconds: 800),
            chartLegendSpacing: 32,
            chartRadius: MediaQuery.of(context).size.width / 2.5,
            colorList: colorList,
            initialAngleInDegree: 0,
            chartType: ChartType.disc,
            ringStrokeWidth: 32,
            legendOptions: const LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.right,
              showLegends: true,
              legendTextStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
            chartValuesOptions: const ChartValuesOptions(
              showChartValuesInPercentage: true,
              showChartValuesOutside: false,
              showChartValues: true,
            ),
          )
        else
          const Center(child: Text("No data to display in chart.")),
      ],
    );
  }

  Widget _statTile(String label, int value) {
    return ListTile(
      title: Text(label),
      trailing: Text(
        '$value',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('yyyy-MM-dd');

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Reports"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<JobCard>>(
        future: _filteredCards,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final cards = snapshot.data ?? [];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: _pickDateRange,
                    icon: const Icon(Icons.filter_alt),
                    label: const Text('Filter by Date Range'),
                  ),
                  if (_startDate != null && _endDate != null)
                    Text(
                      'Filtered: ${formatter.format(_startDate!)} to ${formatter.format(_endDate!)}',
                    ),
                  _summary(cards),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:pie_chart/pie_chart.dart';
// import '../../../data/local/job_card_db.dart';
//
// class ReportsScreen extends StatefulWidget {
//   const ReportsScreen({super.key});
//
//   @override
//   State<ReportsScreen> createState() => _ReportsScreenState();
// }
//
// class _ReportsScreenState extends State<ReportsScreen> {
//   final _db = AppDatabase();
//   DateTime? _startDate;
//   DateTime? _endDate;
//
//   late Future<List<JobCard>> _filteredCards;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//   }
//
//   void _fetchData() {
//     _filteredCards = _db.getAllJobCards(); // Filtering logic can be added later
//   }
//
//   Future<void> _pickDateRange() async {
//     final picked = await showDateRangePicker(
//       context: context,
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2030),
//     );
//
//     if (picked != null) {
//       setState(() {
//         _startDate = picked.start;
//         _endDate = picked.end;
//         // TODO: Apply date filtering logic here
//       });
//     }
//   }
//
//   Widget _summary(List<JobCard> cards) {
//     final total = cards.length;
//     final approved = cards.where((e) => e.status == 'Approved').length;
//     final rejected = cards.where((e) => e.status == 'Rejected').length;
//     final pending = cards.where((e) => e.status == 'Pending').length;
//
//     final Map<String, double> dataMap = {
//       "Approved": approved.toDouble(),
//       "Rejected": rejected.toDouble(),
//       "Pending": pending.toDouble(),
//     };
//
//     final colorList = <Color>[
//       Colors.green,
//       Colors.red,
//       Colors.orange,
//     ];
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 16),
//         const Text(
//           "Summary",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         _statTile("Total", total),
//         _statTile("Approved", approved),
//         _statTile("Rejected", rejected),
//         _statTile("Pending", pending),
//         const SizedBox(height: 20),
//         if (total > 0)
//           PieChart(
//             dataMap: dataMap,
//             animationDuration: const Duration(milliseconds: 800),
//             chartLegendSpacing: 32,
//             chartRadius: MediaQuery.of(context).size.width / 2.5,
//             colorList: colorList,
//             initialAngleInDegree: 0,
//             chartType: ChartType.disc,
//             ringStrokeWidth: 32,
//             legendOptions: const LegendOptions(
//               showLegendsInRow: false,
//               legendPosition: LegendPosition.right,
//               showLegends: true,
//               legendTextStyle: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             chartValuesOptions: const ChartValuesOptions(
//               showChartValuesInPercentage: true,
//               showChartValuesOutside: false,
//               showChartValues: true,
//             ),
//           )
//         else
//           const Center(child: Text("No data to display in chart.")),
//       ],
//     );
//   }
//
//   Widget _statTile(String label, int value) {
//     return ListTile(
//       title: Text(label),
//       trailing: Text(
//         '$value',
//         style: const TextStyle(fontWeight: FontWeight.bold),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final formatter = DateFormat('yyyy-MM-dd');
//
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         title: const Text("Reports"),
//         centerTitle: true,
//       ),
//       body: FutureBuilder<List<JobCard>>(
//         future: _filteredCards,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           final cards = snapshot.data ?? [];
//
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   ElevatedButton.icon(
//                     onPressed: _pickDateRange,
//                     icon: const Icon(Icons.filter_alt),
//                     label: const Text('Filter by Date Range'),
//                   ),
//                   if (_startDate != null && _endDate != null)
//                     Text(
//                       'Filtered: ${formatter.format(_startDate!)} to ${formatter.format(_endDate!)}',
//                     ),
//                   _summary(cards),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
