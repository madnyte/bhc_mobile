import 'package:bhc_mobile/ui/authentication/login_page.dart';
import 'package:bhc_mobile/ui/house/house_details.dart';
import 'package:bhc_mobile/ui/main/main_page.dart';
import 'package:bhc_mobile/ui/settings/faq_page.dart';
import 'package:bhc_mobile/ui/settings/settings_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainPage(),
      routes: <RouteBase>[
        GoRoute(
          path: 'favorites',
          builder: (context, state) => const FaqPage(),
        ),
        GoRoute(
          path: 'profile',
          builder: (context, state) => const FaqPage(),
        ),
        GoRoute(
          path: 'settings',
          builder: (context, state) => const SettingsPage(),
          routes: <RouteBase>[
            GoRoute(
              path: 'faq',
              builder: (context, state) => const FaqPage(),
            ),
          ],
        )
      ],
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/house/:id',
      builder: (context, state) =>
          HouseDetails(id: state.pathParameters['id']!),
    ),
  ],
);
