import 'package:attendace_task_app/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:attendace_task_app/widgets/mydrawer.dart';
import 'package:attendace_task_app/widgets/leave_request_dialogue.dart';
import 'package:attendace_task_app/widgets/my_button.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hasMarkedAttendance =
      false; // Keeps track if the student has marked attendance

  // Method to show Mark Attendance Dialog
  void _showMarkAttendanceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Attendance'),
        content: const Text(
            'Are you sure you want to mark your attendance for today?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                hasMarkedAttendance = true;
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Attendance marked successfully!')),
              );
            },
            child: const Text('Mark Attendance'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Mydrawer(),
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        elevation: 2.0,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Mark Attendance Button
            MyButton(
              onTap: hasMarkedAttendance
                  ? null // Disable the button if attendance is already marked
                  : () => _showMarkAttendanceDialog(context),
              title:
                  hasMarkedAttendance ? "Attendance Marked" : "Mark Attendance",
            ),
            const SizedBox(height: 20),

            // Mark Leave Button
            MyButton(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const LeaveRequestDialog();
                  },
                );
              },
              title: "Mark Leave",
            ),
            const SizedBox(height: 20),

            // View Attendance Button
            MyButton(
              onTap: () {
                context.go('/view_attendance_user');
              },
              title: "View Attendance",
            ),
          ],
        ),
      ),
    );
  }
}
