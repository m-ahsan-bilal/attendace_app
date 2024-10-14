import 'package:attendace_task_app/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';

class ViewUserAttendance extends StatefulWidget {
  const ViewUserAttendance({super.key});

  @override
  State<ViewUserAttendance> createState() => _ViewUserAttendanceState();
}

class _ViewUserAttendanceState extends State<ViewUserAttendance> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go('/home_user');
            },
            icon: Icon(Icons.arrow_back)),
        title: const Text('View Attendance'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TableCalendar(
          focusedDay: _focusedDay,
          firstDay: DateTime.utc(2023, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          calendarFormat: _calendarFormat,
          onFormatChanged: (format) {
            setState(() {
              _calendarFormat = format;
            });
          },
          availableCalendarFormats: const {
            CalendarFormat.month: 'Month',
          },
        ),
      ),
    );
  }
}
