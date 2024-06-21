import 'package:bhc_mobile/themes/theme.dart';
import 'package:flutter/material.dart';

import 'routes/routes.dart';
import 'themes/util.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(context, "Roboto", "Poppins");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp.router(
      title: 'BHC',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
