import 'package:bhc_mobile/screens/home.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const Home(),
  )
]);
