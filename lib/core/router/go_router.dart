import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ish_topdim/features/adding/presentation/adding_screen.dart';
import 'package:ish_topdim/features/entering_profile/presentation/entering_profile_screen.dart';
import 'package:ish_topdim/features/favorites/presentation/favorites_page.dart';
import 'package:ish_topdim/features/home/filtering/presentation/filter_screen.dart';
import 'package:ish_topdim/features/home/presentation/home_screen.dart';
import 'package:ish_topdim/features/one_step/presentation/one_step_screen.dart';
import 'package:ish_topdim/features/registration/presentation/registration_screen.dart';

import '../../features/forgot_pass/presentation/forgot_password_screen.dart';
import '../../features/home/notifications/presentation/notifications_screen.dart';
import '../../features/main/presentation/main_page.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/otp/presentation/OTPScreen.dart';
import '../../features/profile/presentation/profile_page.dart';
import '../../features/splash/presentation/splash_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
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
              builder: (context, state) => const RegistrationScreen(),
            ),
            GoRoute(
              path: 'entering',
              builder: (context, state) => const EnteringProfileScreen(),
              routes: [
                GoRoute(
                  path: 'forgotPass',
                  builder: (context, state) => const ForgotPasswordScreen(),
                  routes: [
                    GoRoute(
                        path: "otp",
                        builder: (context, state) => const OTPScreen(),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state, child) {
        return MainPage(
          key: state.pageKey,
          currentIndex: switch (state.uri.path) {
            final p when p.startsWith("/home") => 0,
            final p when p.startsWith("/favorite") => 1,
            final p when p.startsWith("/add") => 2,
            final p when p.startsWith("/profile") => 4,
            _ => 0,
          },
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              parentNavigatorKey: rootNavigatorKey,
              path: "notifications",
              builder: (context , state)=> const NotificationsScreen(),
            ),
            GoRoute(
              parentNavigatorKey: rootNavigatorKey,
              path: 'filter',
                builder: (context, state) => const FilterScreen(),
            ),
          ],
        ),
        GoRoute(
          path: '/favorite',
          builder: (context, state) => const FavoritesPage(),
        ),
        GoRoute(
            path: "/add",
            builder: (context, state) => const PlaceAnAdScreen()
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        )
      ],
    ),
  ],
);
