import 'package:flutter/material.dart';

class LeaveRequestDialog extends StatefulWidget {
  const LeaveRequestDialog({super.key});

  @override
  State<LeaveRequestDialog> createState() => _LeaveRequestDialogState();
}

class _LeaveRequestDialogState extends State<LeaveRequestDialog> {
  final TextEditingController _leaveReasonController = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Leave Request'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _leaveReasonController,
            decoration: InputDecoration(
              labelText: 'Reason for Leave',
              border: const OutlineInputBorder(),
              errorText: _errorMessage,
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Simulate file upload (frontend only)
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('File Uploaded')),
              );
            },
            child: const Text('Attach PDF/Image'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_leaveReasonController.text.isEmpty) {
              // Show error if text field is empty
              setState(() {
                _errorMessage = 'Reason for leave cannot be empty';
              });
            } else {
              // Clear the error message and simulate submission
              setState(() {
                _errorMessage = null;
              });

              // Simulate leave request submission (UI only)
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Leave Request Sent')),
              );
              Navigator.pop(context);
            }
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
