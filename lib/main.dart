import 'package:attendace_task_app/firebase_options.dart';
import 'package:attendace_task_app/utils/app_routes.dart';
import 'package:attendace_task_app/utils/themes/theme_light.dart';
import 'package:attendace_task_app/utils/themes/theme_provider.dart';
import 'package:attendace_task_app/utils/themes/themes_dark.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp.router(
      theme: themeProvider.isDarkMode
          ? darkMode
          : lightMode, // Set theme based on provider
      debugShowCheckedModeBanner: false, // Disable the debug banner
      routerConfig: basicRoutes, // Use defined routes
    );
  }
}
