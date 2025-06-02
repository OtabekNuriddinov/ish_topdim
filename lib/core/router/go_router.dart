import 'package:ish_topdim/features/change_number/presentation/change_number_screen.dart';
import 'package:ish_topdim/features/change_password/presentation/change_password_screen.dart';
import 'package:ish_topdim/features/change_theme/presentation/change_theme_screen.dart';
import 'package:ish_topdim/features/edit_profile/presentation/edit_profile_screen.dart';
import 'package:ish_topdim/features/settings/presentation/settings_screen.dart';

import 'router_libs.dart';

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
              builder: (context, state) => const NotificationsScreen(),
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
            path: "/add", builder: (context, state) => const PlaceAnAdScreen()),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
          routes: [
            GoRoute(
              path: "settings",
              builder: (context, state) => const SettingsScreen(),
              routes: [
                GoRoute(
                    path: 'edit-profile',
                  builder: (context, state) => const EditProfileScreen(),
                ),
                GoRoute(
                  path: 'change-number',
                  builder: (context, state) => const ChangeNumberScreen(),
                ),
                GoRoute(
                  path: 'change-password',
                  builder: (context, state) => const ChangePasswordScreen(),
                ),
                GoRoute(
                  path: 'change-theme',
                  builder: (context, state) => const ChangeThemeScreen(),
                ),
              ]
            )
          ],
        )
      ],
    ),
  ],
);
