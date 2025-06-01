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
