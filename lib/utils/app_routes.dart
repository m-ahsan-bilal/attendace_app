import 'package:attendace_task_app/auth/login_page.dart';
import 'package:attendace_task_app/landing/splash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter basicRoutes = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: navigatorKey,
  initialLocation: "/",
  // initialLocation: "/auth",
  // initialLocation: '/login_user',
  routes: appRoutesList,
  errorBuilder: (context, state) => Center(
    child: Container(
      color: Colors.white,
      child: Text(
        state.error.toString(),
      ),
    ),
  ),
);
List<RouteBase> appRoutesList = [
  GoRoute(
    path: '/',
    name: "/",
    builder: (BuildContext context, GoRouterState state) => SplashScreen(),
  ),
  GoRoute(
    path: '/login_user',
    name: "login_user",
    builder: (BuildContext context, GoRouterState state) => LoginUser(),
  ),
];
