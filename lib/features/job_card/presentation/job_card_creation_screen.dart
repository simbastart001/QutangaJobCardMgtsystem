import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import '../../../data/local/job_card_db.dart';

class JobCardCreationScreen extends StatefulWidget {
  const JobCardCreationScreen({super.key});

  @override
  State<JobCardCreationScreen> createState() => _JobCardCreationScreenState();
}

class _JobCardCreationScreenState extends State<JobCardCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _db = AppDatabase();

  final _titleController = TextEditingController();
  final _clientController = TextEditingController();
  final _descController = TextEditingController();
  final _techController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _submit() async {
    if (_formKey.currentState!.validate() && _selectedDate != null) {
      final jobCard = JobCardsCompanion(
        title: Value(_titleController.text),
        clientName: Value(_clientController.text),
        description: Value(_descController.text),
        technician: Value(_techController.text),
        estimatedDate: Value(_selectedDate!),
      );

      await _db.insertJobCard(jobCard);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Job Card Created!')),
      );

      _formKey.currentState!.reset();
      _titleController.clear();
      _clientController.clear();
      _descController.clear();
      _techController.clear();
      setState(() => _selectedDate = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Job Card")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Job Title'),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _clientController,
                decoration: const InputDecoration(labelText: 'Client Name'),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _techController,
                decoration: const InputDecoration(labelText: 'Technician'),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              ListTile(
                title: Text(_selectedDate == null
                    ? 'Select Estimated Date'
                    : 'Date: ${_selectedDate!.toLocal()}'.split(' ')[0]),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) {
                    setState(() => _selectedDate = picked);
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
