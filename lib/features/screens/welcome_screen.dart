import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qutanga_app/features/navigation/navigation_controller.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.engineering, size: 80, color: Colors.green),
            SizedBox(height: 20),
            Text(
              'QUTANGA JOB CARD MANAGEMENT',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Manage job cards, approvals, reports and more.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Switch to the "Create" tab (index 2)
          ref.read(navigationIndexProvider.notifier).state = 2;
        },
        icon: const Icon(Icons.add),
        label: const Text('Create Job Card'),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:qutanga_app/features/job_card/presentation/job_card_creation_screen.dart';
//
// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         elevation: 0,
//         title: const Text(
//           'Welcome',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.assignment_turned_in_rounded,
//                 size: 80, color: Colors.green),
//             SizedBox(height: 20),
//             Text(
//               'QUTANGA JOB CARD MANAGEMENT',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.w700,
//                 letterSpacing: 1.2,
//               ),
//             ),
//             SizedBox(height: 30),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 32.0),
//               child: Text(
//                 'Efficiently manage your job cards, approvals, and reporting all in one place.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 16, color: Colors.black54),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) => const JobCardCreationScreen(),
//             ),
//           );
//         },
//         icon: const Icon(Icons.add),
//         label: const Text('Create Job Card'),
//         backgroundColor: Colors.green,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }
