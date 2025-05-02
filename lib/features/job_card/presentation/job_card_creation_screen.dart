import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:intl/intl.dart';
import 'package:qutanga_app/features/admin/presentation/admin_approval_screen.dart';
import 'package:qutanga_app/features/reports/presentation/reports_screen.dart';

// Import the database provider from main.dart
import 'package:qutanga_app/main.dart';

import '../../../data/local/job_card_db.dart';
import '../../navigation/navigation_controller.dart';

class JobCardCreationScreen extends ConsumerStatefulWidget {
  const JobCardCreationScreen({super.key});

  @override
  ConsumerState<JobCardCreationScreen> createState() =>
      _JobCardCreationScreenState();
}

class _JobCardCreationScreenState extends ConsumerState<JobCardCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _clientController = TextEditingController();
  final _descController = TextEditingController();
  final _techController = TextEditingController();
  final _dateController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _clientController.dispose();
    _descController.dispose();
    _techController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _submit() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid && _selectedDate != null) {
      final db = ref.read(databaseProvider);

      final jobCard = JobCardsCompanion(
        title: drift.Value(_titleController.text.trim()),
        clientname: drift.Value(_clientController.text.trim()),
        description: drift.Value(_descController.text.trim()),
        technician: drift.Value(_techController.text.trim()),
        estimateddate: drift.Value(_selectedDate!),
        status: const drift.Value("Pending"),
        admincomment: const drift.Value.absent(),
        // ✅ Let DB handle default/null
        synced: const drift.Value(false),
      );

      try {
        debugPrint("===== Inserting JobCard: $jobCard");
        debugPrint("===== Attempting to insert job card with data:");
        await db.insertJobCard(jobCard);

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Job Card Created!')),
        );

        _formKey.currentState!.reset();
        _titleController.clear();
        _clientController.clear();
        _descController.clear();
        _techController.clear();
        _dateController.clear();

        setState(() {
          _selectedDate = null;
        });

        ref.read(navigationIndexProvider.notifier).state = 3;
      } catch (e, stackTrace) {
        debugPrint("===== Unexpected error occurred: $e");
        debugPrint("===== StackTrace: $stackTrace");

        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving job card: ${e.toString()}')),
        );
      }
    } else {
      if (_selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select an estimated completion date'),
          ),
        );
      }
    }
  }

  // Future<void> _submit() async {
  //   final isValid = _formKey.currentState!.validate();
  //
  //   if (isValid && _selectedDate != null) {
  //     // Get the database from the provider
  //     final db = ref.read(databaseProvider);
  //
  //     final jobCard = JobCardsCompanion(
  //         title: drift.Value(_titleController.text),
  //         clientname: drift.Value(_clientController.text),
  //         description: drift.Value(_descController.text),
  //         technician: drift.Value(_techController.text),
  //         estimateddate: drift.Value(_selectedDate!),
  //         status: const drift.Value("Pending"),
  //         synced: drift.Value(false));
  //
  //     try {
  //       await db.insertJobCard(jobCard);
  //       if (!mounted) {
  //         return;
  //       }
  //
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Job Card Created!')),
  //       );
  //
  //       // Clear form
  //       _formKey.currentState!.reset();
  //       _titleController.clear();
  //       _clientController.clear();
  //       _descController.clear();
  //       _techController.clear();
  //       _dateController.clear();
  //       setState(() {
  //         _selectedDate = null;
  //       });
  //
  //       // Switch to the "Reports" tab (index 4)
  //       ref.read(navigationIndexProvider.notifier).state = 3;
  //     } catch (e) {
  //       if (!mounted) return;
  //       debugPrint("=====  Error saving job card: $e");
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Error saving job card: $e')),
  //       );
  //     }
  //   } else {
  //     if (_selectedDate == null) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //             content: Text('Please select an estimated completion date')),
  //       );
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Create Job Card'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Job Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a job title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _clientController,
                  decoration: const InputDecoration(labelText: 'Client Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a client name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descController,
                  decoration:
                      const InputDecoration(labelText: 'Job Description'),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a job description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _techController,
                  decoration:
                      const InputDecoration(labelText: 'Technician Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a technician name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _dateController,
                  decoration: const InputDecoration(
                    labelText: 'Estimated Completion Date',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  readOnly: true,
                  onTap: () => _selectDate(context),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _submit,
                  child: const Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
