import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/session/presentation/pages/session_page.dart';
import '../constants/route_constants.dart';
import 'routes.dart';

/// Application router configuration using go_router.
///
/// This provides:
/// - Declarative routing
/// - Deep linking support
/// - Type-safe navigation
/// - URL-based routing for web
class AppRouter {
  AppRouter._();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.home,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.home,
        name: RouteNames.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: Routes.session,
        name: RouteNames.session,
        builder: (context, state) => const SessionPage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.uri}'),
      ),
    ),
  );
}

/// Home page widget - extracted for cleaner organization
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: const Text('Welcome to Lumina'),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('A calm, voice-first AI mental wellness companion.'),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () => context.pushNamed(RouteNames.session),
            child: const Text('Ask Lumina'),
          ),
        ],
      ),
    );
  }
}
