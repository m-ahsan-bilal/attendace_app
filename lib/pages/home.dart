// import 'package:attendace_task_app/widgets/mydrawer.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // drawer: const Mydrawer(),
//       // appBar: AppBar(
//       //   title: Text(
//       //     'Home',
//       //     style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
//       //   ),
//       //   elevation: 2.0,
//       //   backgroundColor: Theme.of(context).colorScheme.tertiary,
//       //   centerTitle: true,
//       // ),
//       backgroundColor: Theme.of(context).colorScheme.surface,
//       body: Center(
//         child: Text('Home.dart'),
//       ),
//     );
//   }
// }

import 'package:attendace_task_app/widgets/leave_request_dialogue.dart';
import 'package:attendace_task_app/widgets/my_button.dart';
import 'package:attendace_task_app/widgets/mydrawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            // mark attendance button
            MyButton(
                onTap: () {
                  // Add logic here to mark attendance for the day
                  //     // This can be a call to a function that checks if the user has already marked attendance
                },
                title: "Mark Attendance"),

            SizedBox(height: 20),

            // Mark Leave Button
            MyButton(
                onTap: () {
                  // Navigate to the leave request page // Show the leave request dialog (custom widget)
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return LeaveRequestDialog();
                    },
                  );
                },
                title: "Mark Leave"),

            SizedBox(height: 20),

            // View Attendance Button
            MyButton(
                onTap: () {
                  // Navigate to the attendance view page
                },
                title: "View Attendance"),
          ],
        ),
      ),
    );
  }
}
