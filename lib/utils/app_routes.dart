import 'package:attendace_task_app/auth/register_user.dart';
import 'package:attendace_task_app/pages/home.dart';
import 'package:attendace_task_app/pages/settings.dart';
import 'package:attendace_task_app/pages/user_profile.dart';
import 'package:attendace_task_app/pages/view_attendance_user.dart';
import 'package:go_router/go_router.dart';
import 'package:attendace_task_app/landing/splash.dart';
import 'package:attendace_task_app/auth/login_page.dart';

final GoRouter basicRoutes = GoRouter(
  // initialLocation: '/',
  initialLocation: '/home_user',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login_user',
      builder: (context, state) => const LoginUser(),
    ),
    GoRoute(
      path: '/register_user',
      builder: (context, state) => const RegisterUser(),
    ),
    GoRoute(
      path: '/home_user',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/settings_page',
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: '/user_profile',
      builder: (context, state) => const UserProfile(),
    ),
    GoRoute(
      path: '/view_attendance_user',
      builder: (context, state) => const ViewUserAttendance(),
    ),
  ],
);
