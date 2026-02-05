/// Route paths used throughout the application.
///
/// Using a centralized routes class ensures:
/// - Single source of truth for all route paths
/// - Easy refactoring
/// - Compile-time safety
abstract class Routes {
  static const String splash = '/splash';
  static const String home = '/';
  static const String session = '/session';
  static const String onboarding = '/onboarding';
  static const String settings = '/settings';
}
