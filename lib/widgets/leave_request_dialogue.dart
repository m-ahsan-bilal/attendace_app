import 'package:flutter/material.dart';
import 'image_upload.dart'; // Import the ImageUpload widget

class LeaveRequestDialog extends StatefulWidget {
  const LeaveRequestDialog({Key? key}) : super(key: key);

  @override
  _LeaveRequestDialogState createState() => _LeaveRequestDialogState();
}

class _LeaveRequestDialogState extends State<LeaveRequestDialog> {
  TextEditingController leaveReasonController = TextEditingController();

  @override
  void dispose() {
    leaveReasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Leave Request'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Leave Reason Text Field
          TextField(
            controller: leaveReasonController,
            maxLines: 4, // Allow 3 to 4 lines for text input
            decoration: InputDecoration(
              labelText: 'Reason for Leave',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),

          // File picker for PDF/Image
          ImageUpload(), // The custom ImageUpload widget
        ],
      ),
      actions: [
        // Cancel Button
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        // Submit Leave Request Button
        ElevatedButton(
          onPressed: () {
            // Logic to submit the leave request with reason and file (if attached)
            Navigator.of(context).pop();
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}
