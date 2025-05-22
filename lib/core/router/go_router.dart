import 'package:go_router/go_router.dart';

import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';


final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
          path: '/splash',
          builder: (context, state) => const SplashScreen()
      ),
      GoRoute(
          path: '/onboarding',
          builder: (context, state) => const OnBoarding(),
          routes: []
      ),

    ]
);