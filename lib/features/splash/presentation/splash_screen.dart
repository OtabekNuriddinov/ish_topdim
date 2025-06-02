import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ish_topdim/features/settings/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/theme/themes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _rotationController;
  late AnimationController _scaleController;

  late Animation<double> _opacityAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    _rotationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1300));

    _scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _fadeController, curve: Curves.easeIn));

    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _rotationController,
        curve: Curves.easeInOut,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _scaleController,
        curve: Curves.elasticOut,
      ),
    );

    startAnimations();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _rotationController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: Listenable.merge(
                  [_rotationAnimation, _scaleAnimation],
                ),
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Transform.rotate(
                      angle: _rotationAnimation.value * 2 * 3.14159,
                      child: Consumer<SettingsProvider>(
                        builder: (context, provider, __) {
                          return SvgPicture.asset(
                            colorFilter: ColorFilter.mode(
                              provider.isDarkMode ? Themes.white : Themes.black,
                              BlendMode.srcIn,
                            ),
                            width: 25.0.w,
                            height: 12.0.h,
                            "assets/images/main_logo.svg",
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 4.h),
              Consumer<SettingsProvider>(
                builder: (context, provider, __) {
                  return SvgPicture.asset(
                    width: 70.0.w,
                    height: 4.0.h,
                    colorFilter: ColorFilter.mode(
                      provider.isDarkMode ? Themes.white : Themes.black,
                      BlendMode.srcIn,
                    ),
                    "assets/images/ish_topdim.svg",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void startAnimations() async {
    _fadeController.forward();
    await Future.delayed(const Duration(milliseconds: 300));

    _scaleController.forward();
    await _rotationController.forward();

    await Future.delayed(const Duration(milliseconds: 400));

    if (mounted) {
      context.go('/onboarding');
    }
  }
}
