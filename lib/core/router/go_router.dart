import 'package:go_router/go_router.dart';
import 'package:ish_topdim/features/entering_profile/presentation/entering_profile_screen.dart';
import 'package:ish_topdim/features/home/presentation/home_screen.dart';
import 'package:ish_topdim/features/one_step/presentation/one_step_screen.dart';
import 'package:ish_topdim/features/registration/presentation/registration_screen.dart';

import '../../features/forgot_pass/presentation/forgot_password_screen.dart';
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
          routes: [
            GoRoute(
                path: 'oneStep',
              builder: (context, state) => const Another1Step(),
              routes: [
                GoRoute(
                    path: 'registration',
                  builder: (context, state) => const RegistrationScreen()
                ),
                GoRoute(
                    path: 'entering',
                  builder: (context, state) => const EnteringProfileScreen(),
                  routes: [
                    GoRoute(
                        path: 'forgotPass',
                      builder: (context, state) => const ForgotPasswordScreen()
                    )
                  ]
                )
              ]
            )
          ]
      ),
      GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
          routes: []
      ),

    ]
);