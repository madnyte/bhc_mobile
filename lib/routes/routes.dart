import 'package:bhc_mobile/ui/authentication/login_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => LoginPage(),
  )
]);
