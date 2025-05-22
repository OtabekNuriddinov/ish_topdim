import 'package:go_router/go_router.dart';

import '../../presentation/screen/onboarding/onboarding_screen.dart';
import '../../presentation/screen/splash/splash_screen.dart';


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
          routes: [

          ]
      ),

    ]
);