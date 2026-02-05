import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Splash screen for the Lumina app.
///
/// Displays the app logo, branding, and navigates to the home page
/// after a brief delay.
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _navigateToHome();
  }

  void _initializeAnimations() {
    // Fade animation controller
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Scale animation controller for the logo
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    // Fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );

    // Scale animation with bounce effect
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    // Start animations
    _fadeController.forward();
    _scaleController.forward();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 2500));
    if (mounted) {
      context.go('/');
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF0F4FF), // Light blue at top
              Color(0xFFE8F0FF), // Slightly more blue
              Color(0xFFE8ECFF), // Light purple tint
            ],
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo with scale animation
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: _buildLogo(),
                ),
                const SizedBox(height: 48),
                // App name
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [
                      Color(0xFF1A2447), // Dark navy
                      Color(0xFF2E3E5F), // Slightly lighter navy
                    ],
                  ).createShader(bounds),
                  child: const Text(
                    'Lumina',
                    style: TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Tagline
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    'A gentle light, when things feel heavy.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF6B7A9E),
                      height: 1.5,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          // Outer glow
          BoxShadow(
            color: Color(0xFFC5D9F7).withValues(alpha: 0.5),
            blurRadius: 40,
            spreadRadius: 20,
          ),
          // Inner shadow for depth
          BoxShadow(
            color: Color(0xFF9CBEF5).withValues(alpha: 0.5),
            blurRadius: 25,
            spreadRadius: 10,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFE8F1FF), // Light blue
              Color(0xFFF5FAFF), // Almost white
            ],
          ),
          border: Border.all(
            color: Color(0xFFD4E4FB),
            width: 2,
          ),
        ),
        child: Center(
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Color(0xFFFFFFFF),
                  Color(0xFFF8FCFF),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF9CBEF5).withValues(alpha: 0.4),
                  blurRadius: 15,
                  spreadRadius: 3,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
