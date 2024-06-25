import 'package:bhc_mobile/ui/home/home_page.dart';
import 'package:bhc_mobile/ui/house/house_details.dart';
import 'package:bhc_mobile/ui/main/main_page.dart';
import 'package:bhc_mobile/ui/search/search_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const MainPage(),
  )
]);
